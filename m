Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C84224887;
	Mon,  7 Apr 2025 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050011; cv=none; b=JLAwPM7CBWhiMWY2KqVZ+BvC69VPPfT1AZ4zQxMIiNSMZS4Us0N/IK4N+XJJCPcJD49rJYRjULL5oxwpiH5nBCMNHy5B1bun9WSP+s1rQHdwy4obqx1VOgsggioP4HrDmkJH3WLVVK3ZSMv2aVTydejxlg4I3ZdpSW5q1thxAe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050011; c=relaxed/simple;
	bh=mDntV+OO7giiUPJa+o2ZAE5kZmzQ/hfia5lDmIIMwYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaPF5tzWalg9jqLC8P5Ji6v2IhOWjTm8cAex/Ti12TRNruEiYQZsR7AiYM5YRwjdmBRFVTmT5I+TIq9kDPzENQP0JoDY0Ua5Yo+sf8p4IVJl0zGDDfDgYfzWR/1mAP+MocV4eDLoFEGMYdfR1KOZleWfjdv65+eEIOYt/jhbs7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8Wp9S5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8Wp9S5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3BBC4CEE9;
	Mon,  7 Apr 2025 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744050011;
	bh=mDntV+OO7giiUPJa+o2ZAE5kZmzQ/hfia5lDmIIMwYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8Wp9S5g6hIfb69q0yLGut2ceJQ5IAiT8mva6i1tgJF7Hmg2ud+6MwEr5XBp7rqSA
	 30aRQXeqRbNvZYTSxMoTGsUFehvjcx5P+2eTfF5/Z8zz4EDC+ck5GdZjcoEdIsilUf
	 J7Sob/wYVwVPXx+g2mzXzFH9ZpA1HPyhhCZ2H7UH9YFPQ0t44NGrZJSUTKoE7WsDD+
	 3iyVAIUmMVwiOSSLFql/YFZto/Z3zUbRzJHFMBdplaYH1vEXTX6Y0j1xCNH1NyNQhe
	 Skj6NJ0M7mdP9fQJKKi4gmgjmT7Jtqetio9yzCfi/9O54S87Ly+0EvA3VGaL+QNE6n
	 1TXwLCUyem32A==
Date: Mon, 7 Apr 2025 20:20:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] selftests/x86/lam: fix resource leak in do_uring()
 and allocate_dsa_pasid()
Message-ID: <Z_QXURMplbCtx-YB@gmail.com>
References: <CAE2+fR_kG1SpE3DZ6cbZL+J8HT25RcaGxYrZP-H+rDFSJG6sdQ@mail.gmail.com>
 <20250407104445.442876-1-malayarout91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104445.442876-1-malayarout91@gmail.com>


* Malaya Kumar Rout <malayarout91@gmail.com> wrote:

> @@ -1189,9 +1191,10 @@ void *allocate_dsa_pasid(void)
>  
>  	wq = mmap(NULL, 0x1000, PROT_WRITE,
>  			   MAP_SHARED | MAP_POPULATE, fd, 0);
> -	if (wq == MAP_FAILED)
> +	if (wq == MAP_FAILED){
> +		close(fd);
>  		perror("mmap");

We should unconditionally close 'fd' after the mmap() call, not just in 
the perror() branch.

Thanks,

	Ingo
