Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F27C1DDC1B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431820; cv=none; b=oZ3N5G+P1u8uCwKKskdIS6BopFh8MiilXGOg012nOLbXUc5Dm5+5SZ6iWkMWWtyLU65xBodqVOd9V3OaQH9EvTJsY6eR0MoS2Qp+jAiPcmoFTFuFCtFKuvUYS5YmuhHuvre3G1ziWZ9Zt4NF0s3NyNf5i4UfcMfBpkyNWLgI/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431820; c=relaxed/simple;
	bh=pAWgZPUpIpUgyT3VWwOiSO1AQ4b93ZdBO260EEQHISg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Kkkq1rk0h6Nyq+QCJs3f/webqml+Kg4rEjBgflDBvRcXb0mjL2kIIvOVn0RKeiKUB0eAe4tc1RJZRxYvhPaEkLXltgh/wjHURmZY1N3iIszya7zj2R6HX1A1yXoW+vbxRySJ5shG3dcxjTHkQx3HKws/4rKd8Jt9eExZKZa8tlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cvvceCHf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cvvceCHf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb85ce788so1062044666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746431816; x=1747036616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mUbv0W6uCGVgpd1Hd4E+zV1V3l3rM9wbsGelOPIyJg=;
        b=cvvceCHfdvYLpnqC3W5LbcEkUO74Co6enl1FMV59TOB6V4BFR+brkTGNedzGMRpYqk
         Hp9Ss3xEK2x9dvs3OdlMpl0MvPwi7F4wPegODjP+q1VeMlgNaIPXmEfWhgAllBj7WK5d
         WtFXszuVBT5DGDNGvdMg8wJ19zUnJYjlFCy2Fx5TQPlaT/28ag7sfnuesZO8YWlQrKBt
         o4a8sr/6g4DUpIbXAqIdkVt7ICGrbKXt4aHeXwmpv7KfxzDb0QjtcqWJZ+ckdpKI1L4l
         kJWITId0W5ubD+BTsp0YtKqeojCnKzLPEFg9bxQBakWQVsCfqlacTT9uo0W7llSm/q/x
         ipqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431816; x=1747036616;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mUbv0W6uCGVgpd1Hd4E+zV1V3l3rM9wbsGelOPIyJg=;
        b=Qv5MqtDgql/2LUZ5FkkkeJfVOnehlURND5yQny3VNDET3KW5DNBisr87oDMLWXb4yt
         iq8D6bFO+15ikN8/0UPKNW3vLsUeg6LPwLZAp7d5FtU4gQzNvIvs7vqHxmfyiHpkxBMp
         FbyAyTmB0hqHMn5gdD9aOd+AM0dXEOpgBdwY1yO0bZ8uhXgT/WOuIICl55CUbTDh3VBH
         J1gU9XDIxCdOlmXj040P24MsjzvgORmC4u3hflIeSORs2JU/Ahw0xVD0LX6EITKvpta2
         m0ypUcDMF0NrshI7WjJHctknzmz2qS30ov51zO27AOZO9kb9P8yyZThax/pq98oTaN47
         gEsw==
X-Forwarded-Encrypted: i=1; AJvYcCXcbWz+7rzi42/u+KHDttx2XhiI1cihR7O5qs5CZuDog4+t6Oz8QBfwN2/Xf8J6VJTJEUOAEPMiZXV+zpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QsjFIJGmPQUbCjyIOb3tRqBxHTsnTL9WnjCdzG2COVcsns6j
	h4ZhusJyHJKs7ThTc92A/MQbTcrn7htrLjYpqjDkio3INXGZGgFh8svOM/lnKKQb3LpHPvJwjwC
	Kp4E=
X-Gm-Gg: ASbGnctpJ8k07lZUmwRuJeTuvIciLa2ItPu0bU+xWLbQfH0l/9yggisqcSEbo/OY3ZR
	bqnG90dEttQ+2w0ycpKEPnL/fFbqqXTUiL/BpvQHJ84hXFWWFIdK0N+WOo3Vx/yIcw0pvgG1bUL
	XMXdcf8q3HZuC0osZadaZ8TqUhK4CJbEBF/YlVClCxdXSERTaVF00VF/Syia4QrlbZ5dMPYzZkx
	3oacSesiu1gDki1LX0zwACnl/e5oxzEQG6X3nILETVdnpArLJk0nImetU63geY4Dp5n0HsrNFvR
	G4tTqcF0RlbCKoGw/qgFfvmY7Q74x72vuBaz
X-Google-Smtp-Source: AGHT+IHzN2cA2nHs40CaeprL9r0WDJzIE1z4Pb3PLfMWF8U8m0J4x4gZNJbK1lAlCv/Z2ZPIWB1laQ==
X-Received: by 2002:a17:907:7ea5:b0:aca:c507:a4e8 with SMTP id a640c23a62f3a-ad190654f47mr719151866b.21.1746431816422;
        Mon, 05 May 2025 00:56:56 -0700 (PDT)
Received: from u94a ([2401:e180:8d00:cbd5:8acd:bddd:354b:e20d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm8178803a91.31.2025.05.05.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:56:55 -0700 (PDT)
Date: Mon, 5 May 2025 15:56:51 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: cve@kernel.org
Cc: Greg Kroah-Hartman <gregkh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: CVE-2023-53076: bpf: Adjust insufficient default bpf_jit_limit
Message-ID: <txekiviwb3to6dmpx24v7layiwspnsq4v3ycqce6t2huni2goe@25r4mcnexibm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050215-CVE-2023-53076-d1a7@gregkh>

On Fri, May 02, 2025 at 05:55:41PM +0200, Greg Kroah-Hartman wrote:
> From: Greg Kroah-Hartman <gregkh@kernel.org>
> 
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> bpf: Adjust insufficient default bpf_jit_limit
> 
> We've seen recent AWS EKS (Kubernetes) user reports like the following:
> 
>   After upgrading EKS nodes from v20230203 to v20230217 on our 1.24 EKS
>   clusters after a few days a number of the nodes have containers stuck
>   in ContainerCreating state or liveness/readiness probes reporting the
>   following error:
> 
>     Readiness probe errored: rpc error: code = Unknown desc = failed to
>     exec in container: failed to start exec "4a11039f730203ffc003b7[...]":
>     OCI runtime exec failed: exec failed: unable to start container process:
>     unable to init seccomp: error loading seccomp filter into kernel:
>     error loading seccomp filter: errno 524: unknown
> 
>   However, we had not been seeing this issue on previous AMIs and it only
>   started to occur on v20230217 (following the upgrade from kernel 5.4 to
>   5.10) with no other changes to the underlying cluster or workloads.
> 
>   We tried the suggestions from that issue (sysctl net.core.bpf_jit_limit=452534528)
>   which helped to immediately allow containers to be created and probes to
>   execute but after approximately a day the issue returned and the value
>   returned by cat /proc/vmallocinfo | grep bpf_jit | awk '{s+=$2} END {print s}'
>   was steadily increasing.
> 
> I tested bpf tree to observe bpf_jit_charge_modmem, bpf_jit_uncharge_modmem
> their sizes passed in as well as bpf_jit_current under tcpdump BPF filter,
> seccomp BPF and native (e)BPF programs, and the behavior all looks sane
> and expected, that is nothing "leaking" from an upstream perspective.
> 
> The bpf_jit_limit knob was originally added in order to avoid a situation
> where unprivileged applications loading BPF programs (e.g. seccomp BPF
> policies) consuming all the module memory space via BPF JIT such that loading
> of kernel modules would be prevented. The default limit was defined back in
> 2018 and while good enough back then, we are generally seeing far more BPF
> consumers today.
> 
> Adjust the limit for the BPF JIT pool from originally 1/4 to now 1/2 of the
> module memory space to better reflect today's needs and avoid more users
> running into potentially hard to debug issues.
> 
> The Linux kernel CVE team has assigned CVE-2023-53076 to this issue.

I'd like to dispute this CVE.

The fix here is raising the (sysadmin adjustable) default of
net.core.bpf_jit_limit to 50% of the module memory space from 25%
before. It does not seem to have security implications on the Linux
kernel side.

Shung-Hsi
