Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F524113C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573731; cv=none; b=B35BydXvOLhuZ2uzGA2uQsx4exgxHXiy0eaQkl4ryw+/8KHxW/yMlYwD/jq7A9oVUsKlcO6BgkHYp9A86HpXCsR3GfDEJUSOsWC0ppnB8VQraeHBJwU8n6lsUCiP8eEPW5COdMh3zv+TkHAAn5zR0TwSmPxseBwL9Dr06yiXjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573731; c=relaxed/simple;
	bh=oG0agEwdbAiZaE2N1n/SMq35flaiH9baH2aZNlVLJR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXZJpPbhue9qHE0jQWc3WrDBF11p0TYq1gR+WPsgWHH8qQ+wgAw40SW8gorkoSeCssLQtYd6Fnoy0FtXVgjFVqCCZ4iPjY1I2qkp38fN4w8yKJhLV8dQLqENUsn09J7bo+qWEnKomB8AwBYp81acew8CSikYB02Hx1VeygNi4B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A5+FU7rw; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A5+FU7rw"
Message-ID: <f8ecfb2d-c82f-4785-b5dd-eccec0d13f8a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749573717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oG0agEwdbAiZaE2N1n/SMq35flaiH9baH2aZNlVLJR0=;
	b=A5+FU7rwNiSh5Up/2yQSOwZGDMi2xkwvRRuP6uTg1ZopTqc8pXJEvX9AV7YhGs+umpg84x
	qmCGFuTMtsMpvIKttlQOAFja/Zt+P00wm+iIqizB8Rha3VgDtyIBoci+HHH78QYsIK3qZG
	DzEwwnwCRDKI1NTeXg2VkwmA636Cov0=
Date: Tue, 10 Jun 2025 09:41:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] bpf: Specify access type of bpf_sysctl_get_name
 args
Content-Language: en-GB
To: Jerome Marchand <jmarchan@redhat.com>, bpf@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>
References: <20250527165412.533335-1-jmarchan@redhat.com>
 <20250610091933.717824-1-jmarchan@redhat.com>
 <20250610091933.717824-2-jmarchan@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20250610091933.717824-2-jmarchan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/10/25 2:19 AM, Jerome Marchand wrote:
> The second argument of bpf_sysctl_get_name() helper is a pointer to a
> buffer that is being written to. However that isn't specify in the
> prototype.
>
> Until commit 37cce22dbd51a ("bpf: verifier: Refactor helper access
> type tracking"), all helper accesses were considered as a possible
> write access by the verifier, so no big harm was done. However, since
> then, the verifier might make wrong asssumption about the content of
> that address which might lead it to make faulty optimizations (such as
> removing code that was wrongly labeled dead). This is what happens in
> test_sysctl selftest to the tests related to sysctl_get_name.
>
> Add MEM_WRITE flag the second argument of bpf_sysctl_get_name().
>
> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>

Acked-by: Yonghong Song <yonghong.song@linux.dev>

