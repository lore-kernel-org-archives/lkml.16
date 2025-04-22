Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13E1F37D8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360173; cv=none; b=DjKIwU/sdEcpN1J8+1zxZL6NEPYo+wDT16DUtY6HlMZugVgNFRvkZ/WGqFyIla/jan1O+tJO1UlI1M3nKRP5xlOnHhhK7wCXRT72L3GaV3CLY6hpGk2wcmrs3uOtj1vrJyuoIQymEvnUsnYX9GujW2hJPFI9bv6K8/u5ngqLREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360173; c=relaxed/simple;
	bh=IE3neCFeH8Ltp6M5nRCbhKk2+CFGXNaRuRMA4BAHueA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS+aX12T6qRzIQ7992n5DpPbDb8ObMphOTodiEBHzuZrT2X3nHVixDp/jtQbxBk0Hx5/NxezT0ohvwxhZ+mqZvPSdQ1fLgIzAl9BRHd7OrxlUeVc6uuZ5agaAufluaKcSTGBMu2G6oAbfiLDBjbkk3UhPV/rX3sotYnMZAcKtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xCG/bhHn; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xCG/bhHn"
Message-ID: <e7ee365f-f275-4ee0-80fb-370cb3c242ea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745360160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpqNkvbG+KJDxSHIgORRKjY9g4VUmpJpSov6APykpLw=;
	b=xCG/bhHnVpzOhulR68NdnviFXEbMixLVOUW4sLkmunjj4+7PthRHexn3MQiDQVmRTbqUsU
	BS9AVVqd4LlJCMtUOl1RaiAObrqMP+nKrrQD4ZIzFeAPuIlSnsLvylhlze/oOiNi1gCabJ
	zKZs7POUhWgFM3rEMWkKgObLcqxFRS4=
Date: Tue, 22 Apr 2025 15:15:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] selftests/bpf: Fix null pointer check in skb_pkt_end.c
To: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422182331.1188338-1-pvkumar5749404@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20250422182331.1188338-1-pvkumar5749404@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/22/25 11:23 AM, Prabhav Kumar Vaish wrote:
> Ensure that 'tcp' is checked for NULL before dereferencing. This resolves
> a potential null pointer dereference warning reported by static analysis.
> 
> Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> ---
>   tools/testing/selftests/bpf/progs/skb_pkt_end.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/skb_pkt_end.c b/tools/testing/selftests/bpf/progs/skb_pkt_end.c
> index 3bb4451524a1..db33ff2839f7 100644
> --- a/tools/testing/selftests/bpf/progs/skb_pkt_end.c
> +++ b/tools/testing/selftests/bpf/progs/skb_pkt_end.c
> @@ -45,10 +45,10 @@ int main_prog(struct __sk_buff *skb)
>   		goto out;
>   
>   	tcp = (void*)(ip + 1);
> -	if (tcp->dest != 0)
> -		goto out;
>   	if (!tcp)

This case will never be hit, so this change is not doing anything other than 
silencing the static checker. Take a look at commit 9cc873e85800 
("selftests/bpf: Add skb_pkt_end test"). The test was written to have a specific 
llvm generated code. You will need to check the generated code is still testing 
what it is supposed to test.

pw-bot: cr

>   		goto out;
> +	if (tcp->dest != 0)
> +		goto out;
>   
>   	urg_ptr = tcp->urg_ptr;
>   

