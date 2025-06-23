Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BFD24113C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679616; cv=none; b=DjrycTo/NNId7yaONs5Cu5kYJgF5BaUBy3YXi4CnbKxu5YlHF1WbLzOPIL+ndU4uEzYoYYCpuHImrIp3nkotFcOwgRQgC3nQpWdxBFaqh8xQt0Iom6Rk6XN5lwGcns4FZSkrTnzfMEBDkHNHhz0xlybeHzavWJF9Xz58ipbe9u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679616; c=relaxed/simple;
	bh=meSSaiClcTR3xytadiOo1QSIp8vuhc8I1Sqto7MpMa8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S56loCIJDcm2GbVSwKsPZH+EVxQEjGFB8AkazVNp2s0UkSZlsvf0SBVQKYY9/14atAQmQ0JO+yp083VeM8KK3Tw/HPoBqWQEzuQFm0r/V7IZVEpkiZ5ZS8FM9T+iw9ux2hif1g1D1oYn3ZGggwYuLhh5RZMjksmT1X8MYZlsOYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jQ5dw8or; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jQ5dw8or"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso32400785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750679613; x=1751284413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq26HgMplW+iBe5gfE+wjImdYQOdVkOYsdy0RjL36+Q=;
        b=jQ5dw8orN6Erhft8TxahKnXGsVsye9kiLwF3zAS5DHMoRA5CJ6bdvAUfkBrAMSvZB5
         Lht+m68SeQuXbw4h8QrlVvnuNm5zBaILZIy4itYnHAhQCStVCZJoxPb+xnP7l9j6+w+s
         Pk1aJptnq2wZBB/EpJ4BuP9YzosMI+FP3mCF1JQlH+PXVpSfpu+otjKZ+/I+4mjQ0Fyf
         47XI76QC0vevUdubhXg7HuyB1kEKqCwLsdQXHjjCBAQcwdTYDWL68+7tqzQE/eXVL970
         hEGLf3leVvNZr1Vc/XcPQdBauLkuF2V75ZwW3IAE/tzJe/8H18WoBVrX51b6ENrotKGy
         bodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679613; x=1751284413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq26HgMplW+iBe5gfE+wjImdYQOdVkOYsdy0RjL36+Q=;
        b=T/M8DbVxKHuWtdhX0YtXwKcF2OVz/0+unWcBrdK33JqeTbEt9xeEMh8QYEMIRMKheP
         CRS7jWHkPR/QI98MSoHh2E8Dfl6J1JK/1upWRqUnUbtvGTX1cnE7T+MLNLUKAW3dhrF6
         0cxc+IsORVmAhx5Cr3q+9Vzt/OHNsxjjxSMTimpkJgniCMgxw/9Neq6eyAq3KZZX3Des
         s0MwnblYUnK9U8CYyWeWqNEZuBB6DkbZ1tDmQAy94jtGyOJ57bfBOXpz8cl0wgiCYUX6
         rElNi/fXzp66xwUNTYYM4LCiVu2ZlJSG1SZqpJ6FYM5hhZFsZsop4z4PfkWHVoIC9oPa
         C2mg==
X-Forwarded-Encrypted: i=1; AJvYcCXklS6LjiiaE4ueGIpvNgqA6fhdTG2HA3dSDkrLLW8JN1e2ptjkYueAxRPUV0fl2LH45qJvgw9/LLVJe28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsA6yyIfOSBNEbzpKwZvOaeFGBipLOdxoUwbJOuONAKSB5VPy
	HVjju/6gKhQ+4+xgBwNHTZEnzNNnRQBU0ow+BTkDpmMJz81rYHdWC13Af0XQUYFpp9SuYyTCXVw
	n7525qaGCR/uEspsjxw==
X-Google-Smtp-Source: AGHT+IG/PACjb/8clKrij6qBHXLOrCj3ALdLB87G4GVhJuXUp6vBh37RSN00Zx41EePm95+3dS/PoIBnOrlgusY=
X-Received: from wmtf5.prod.google.com ([2002:a05:600c:8b45:b0:450:da87:cebb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5490:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-453655c30e4mr133788405e9.15.1750679612832;
 Mon, 23 Jun 2025 04:53:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:53:30 +0000
In-Reply-To: <20250622164050.20358-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250622164050.20358-1-dakr@kernel.org> <20250622164050.20358-2-dakr@kernel.org>
Message-ID: <aFlAOr8eutB1o-WF@google.com>
Subject: Re: [PATCH v2 1/4] rust: revocable: support fallible PinInit types
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 22, 2025 at 06:40:38PM +0200, Danilo Krummrich wrote:
> Currently, Revocable::new() only supports infallible PinInit
> implementations, i.e. impl PinInit<T, Infallible>.
> 
> This has been sufficient so far, since users such as Devres do not
> support fallibility.
> 
> Since this is about to change, make Revocable::new() generic over the
> error type E.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
