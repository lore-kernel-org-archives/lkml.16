Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD5347C7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751337120; cv=none; b=pTJ55iXg3qshoyRKnYQAitlV9OVdgqsH/P5oIjR3XLchlMnO0x4Bgqu9NQUrP4z9yAtHkwkeRA4DIEZ7X/GHalXPB49SDOa8KTuDjAuVglA9ExY0/4hEQxS/LelyWGATLYQT1PuDNe2vj5qZWuKmvvDkEmPUM/THDjrJwtNo9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751337120; c=relaxed/simple;
	bh=8NpoC/2YO8niXEH80SNQtaghpb9XsxgvpCPOfYnrrlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpwFiFGjCKHjuuX4qYPPFdobvlNOB0Vp9hC7zdmZN2oHgUbp8K2qMZQf9I2bH5SQqCvJHWLEJO3NDC6E6FdNlzpimMzzot7gn2xRmiUa7bmbcZBwbCeX01gRS9LIhfRocBIrhkJ8U5uqfVqB8BLDYFbITpvJHvZOguzRtT51zNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A1Rx7iDf; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A1Rx7iDf"
Message-ID: <21fbb0ba-25bc-4457-9f12-b5a8f6988e4c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751337105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXljdVrrxoPvqauklv8tT8Mwgp1kJxuGXdb4LDpElK4=;
	b=A1Rx7iDfZcI0Hhq3VVtqJAq9esCWrdJYDMrsAbOTleX/v0JFIqVan2o6uxa4lxrz54uyZE
	KD4xrmvHPanw91LgFs/O/kqRWJCbeC9DPvy598UCnVtAR64Wvu5l17cakjO0O4iJPS3B9T
	g6bMBN2yNfCZ97ot0Yw6OYBp061uY+Q=
Date: Mon, 30 Jun 2025 19:31:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] bpftool: Add CET-aware symbol matching for x86_64
 architectures
Content-Language: en-GB
To: Yuan Chen <chenyuan_fl@163.com>, ast@kernel.org, qmo@qmon.net
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yuan Chen <chenyuan@kylinos.cn>
References: <20250626061158.29702-1-chenyuan_fl@163.com>
 <20250626074930.81813-1-chenyuan_fl@163.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20250626074930.81813-1-chenyuan_fl@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/26/25 12:49 AM, Yuan Chen wrote:
> From: Yuan Chen <chenyuan@kylinos.cn>
>
> Adjust symbol matching logic to account for Control-flow Enforcement
> Technology (CET) on x86_64 systems. CET prefixes functions with a 4-byte
> 'endbr' instruction, shifting the actual entry point to symbol + 4.
>
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>   tools/bpf/bpftool/link.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
> index 03513ffffb79..dfd192b4c5ad 100644
> --- a/tools/bpf/bpftool/link.c
> +++ b/tools/bpf/bpftool/link.c
> @@ -307,8 +307,21 @@ show_kprobe_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
>   		goto error;
>   
>   	for (i = 0; i < dd.sym_count; i++) {
> -		if (dd.sym_mapping[i].address != data[j].addr)
> +		if (dd.sym_mapping[i].address != data[j].addr) {
> +#if defined(__x86_64__) || defined(__amd64__)
> +			/*
> +			 * On x86_64 architectures with CET (Control-flow Enforcement Technology),
> +			 * function entry points have a 4-byte 'endbr' instruction prefix.
> +			 * This causes the actual function address = symbol address + 4.
> +			 * Here we check if this symbol matches the target address minus 4,
> +			 * indicating we've found a CET-enabled function entry point.
> +			 */
> +			if (dd.sym_mapping[i].address == data[j].addr - 4)
> +				goto found;
> +#endif

In kernel/trace/bpf_trace.c, I see

static inline unsigned long get_entry_ip(unsigned long fentry_ip)
{
#ifdef CONFIG_X86_KERNEL_IBT
         if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
                 fentry_ip -= ENDBR_INSN_SIZE;
#endif
         return fentry_ip;
}

Could you explain why arm64 also need to do checking
     if (dd.sym_mapping[i].address == data[j].addr - 4)
like x86_64?

>   			continue;
> +		}
> +found:
>   		jsonw_start_object(json_wtr);
>   		jsonw_uint_field(json_wtr, "addr", dd.sym_mapping[i].address);
>   		jsonw_string_field(json_wtr, "func", dd.sym_mapping[i].name);
> @@ -744,8 +757,21 @@ static void show_kprobe_multi_plain(struct bpf_link_info *info)
>   
>   	printf("\n\t%-16s %-16s %s", "addr", "cookie", "func [module]");
>   	for (i = 0; i < dd.sym_count; i++) {
> -		if (dd.sym_mapping[i].address != data[j].addr)
> +		if (dd.sym_mapping[i].address != data[j].addr) {
> +#if defined(__x86_64__) || defined(__amd64__)
> +			/*
> +			 * On x86_64 architectures with CET (Control-flow Enforcement Technology),
> +			 * function entry points have a 4-byte 'endbr' instruction prefix.
> +			 * This causes the actual function address = symbol address + 4.
> +			 * Here we check if this symbol matches the target address minus 4,
> +			 * indicating we've found a CET-enabled function entry point.
> +			 */
> +			if (dd.sym_mapping[i].address == data[j].addr - 4)
> +				goto found;
> +#endif
>   			continue;
> +		}
> +found:
>   		printf("\n\t%016lx %-16llx %s",
>   		       dd.sym_mapping[i].address, data[j].cookie, dd.sym_mapping[i].name);
>   		if (dd.sym_mapping[i].module[0] != '\0')

