Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59A23E330
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902658; cv=none; b=gHY9EWw77peBe6RhMM6C1Up1MTqVPNKzryEzN+MGBCfIa8t1oTim9VEi7TQbcK3Z0FETFn8PGXd8IJp+wNzDF2ZNFDLszIfaTfa1Tp9mjvL8kAQ7ifgj5cU0HV7jyW659oBxb0gk81tskLGHcsYq8M+FltncLNK38bNbd3WLlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902658; c=relaxed/simple;
	bh=LiZgga9x8uNn0x7WdTDXbakOF44Ru5INCev66F2o+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAsaq5LqmKVBDSY4L296UVe9Upfo5vlF2hb3YynJdvaeZC5HQDGJV0j6sMbUnQafvUAnZol9cvMDpczboQ5XyYN+QcbQrBoKow37ZpLjq2Fkp6gyWUpXQi4qnioaXC/o8JrSuFkQGDLTbJ/fwqqPAeTEgQ+PUI1l9oBBEDRRxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=H3yATVk1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="H3yATVk1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-226185948ffso10126735ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1744902655; x=1745507455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiZgga9x8uNn0x7WdTDXbakOF44Ru5INCev66F2o+Dc=;
        b=H3yATVk10aZqoRI+w4nNhDNAcSrm+D72kf09ipil/lhZBQVG98+L9kHkPcmnSnwazQ
         2l2q7/rcLpNyHl7W14wjQCbWN87G0IAsm+Yej1cduBZyRY+bLzSw3rdEYxijZFieiE5K
         4p9sZvZQrU1T5YW0n/Phw1rSXkT4kX9Je/Pl622+TtYHoFzbnncoMrFYet2UFNdX7dEZ
         Kp5GDmv6d0PucyJocp1zYdAefTVH68d510dC+sFSGKo4O3dpzsf/SX5osPX6hm1NRhbn
         mn8Q/7MwclR7BEHoMAaKF+jTuamIjIVUOtP2h2aefp90oQRbxnCBj4UUds3GxtLFjNgk
         ZaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744902655; x=1745507455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiZgga9x8uNn0x7WdTDXbakOF44Ru5INCev66F2o+Dc=;
        b=Cd5z3vZ3JctX+ycfh3sSHzi/6vwnan8wnb2edRjKoFC6NPvNC3r3pfYCOihX5UMHlK
         1QTE7u9J7QoYfvcIVxI/AQvu/B6BedjYnOH3yWrMdigutzijlxCjW3ia1lj2xnbM/edp
         pK94eZya2DE87Ki/u1STyp3zsbljCJ9kehLc61UV/lRtvEBuRuaomt1hdwWguVa7HEeK
         6KvIpdneWwD3uFgp0SQqBazNskU/cOAO4Dsil0VGRCV471+gUfXVV/dzIpupcuaQZY5N
         Aoz7zrIxcZt0NPPcxCYGy7LM6D5eoThIxMm8oFH9sp337P/KPQZrkPap+xwXiN7otS2C
         QHzw==
X-Forwarded-Encrypted: i=1; AJvYcCVQBXh5WCboPmhOjrfnzAN2UwdzZKUGs0B6/ulvuyqYL6sHf7LP96wTHpgVsX5VXY9w3K540vf+vWD3QhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qOCj7QrlwigR9DQ5OxCyEjmbbzO8RcKJd2qHb1jofr98QTDZ
	uZAeePmHdyGNaj9zv9oz2s8MiXq3uj6cmPGLQ2lVz83xEWvG/rRr8xazefDyQlg=
X-Gm-Gg: ASbGncvInYNfwcC24xC6IogHKur1GWzP4e/dyMhqD4M0JCa8ohUC0svNc91GrX/nl6N
	YsBdnZMZuxzVbHRPZrL/63Hl3UGMO34JcEXFgqoOcDZ7MxPPfI9YEpeXLnh5/AnQu7trD5E5Qj4
	i/KYo4P05ZhYv5DVa1g1B3qcyhGd9XOpfjgiFGCk4A97055j+enjarZcPrwxT9fsY+91MMRrJcM
	zHJlyZKD3+hKvSkcDoP5r7V9v6ud87eoFU6+3KF6aL9ITCdlEq0lOqF7+GP8SYF9N5NJs2I8udV
	vG1TfVZQqHyoPjJymDnEpVeLfgehEqB7F5k+wZpPVwl4ri2YulysWPD82CCGBqNSLqg8uf9dJuF
	JU8YgFZkHtsCn9Tpa
X-Google-Smtp-Source: AGHT+IHIP5FBpE6QRyj07ov+jrBL6Cb9idEsBOVjWQ1/IColpF0qdvEnnkroDFpHC82/JIDmUgRLTQ==
X-Received: by 2002:a17:902:f642:b0:220:c813:dfd1 with SMTP id d9443c01a7336-22c359734c3mr102186955ad.36.1744902655602;
        Thu, 17 Apr 2025 08:10:55 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c210esm12348763b3a.41.2025.04.17.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:10:55 -0700 (PDT)
Date: Thu, 17 Apr 2025 08:10:53 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 longli@microsoft.com, kotaranov@microsoft.com, horms@kernel.org,
 kent.overstreet@linux.dev, brett.creeley@amd.com,
 schakrabarti@linux.microsoft.com, shradhagupta@linux.microsoft.com,
 ssengar@linux.microsoft.com, rosenp@gmail.com, paulros@microsoft.com,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH 2/3] net: mana: Add sched HTB offload support
Message-ID: <20250417081053.5b563a92@hermes.local>
In-Reply-To: <1744876630-26918-3-git-send-email-ernis@linux.microsoft.com>
References: <1744876630-26918-1-git-send-email-ernis@linux.microsoft.com>
	<1744876630-26918-3-git-send-email-ernis@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 00:57:09 -0700
Erni Sri Satya Vennela <ernis@linux.microsoft.com> wrote:

> Introduce support for HTB qdisc offload in the mana ethernet
> controller. This controller can offload only one HTB leaf.
> The HTB leaf supports clamping the bandwidth for egress traffic.
> It uses the function mana_set_bw_clamp(), which internally calls
> a HWC command to the hardware to set the speed.

A single leaf is just Token Bucket Filter (TBF).
Are you just trying to support some vendor config?
