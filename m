Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817421C19C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123087; cv=none; b=hT3eXyjIa1/evmCbJazuHHszHkGsF/Achra3w881hWyZGSAXrKYLu8XkUcY3ISlXsCjb4Yz7Ks5tKLtobXCJrWZ9c41bVJxugZ6VFwx7ltb4pkg4Tw0aJe7AieF0pr6rKhOlqdCKkpCqtkd0mCxOG9v1RZt0JssczybStlFEqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123087; c=relaxed/simple;
	bh=AYelcBhf4pn8LEoyKEfvxKufNEl9vFt+bZZ8KVzgmAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRMFT0W6AZYcMBud/vqbMapFwr0WtCww9JZkkv9tGcx/YWbQBiI1iOwRysiDu3vq/k79XpUw1+uZntM0l9gDGOnM6epU2BP9wzzCegiJ3srnYlj16yvmdotu/BjXECUu5XXU+k3H1Yj9ql6+z+ahjgV87AhcjBw2lBfp0CO3AgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VXVRnqVW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VXVRnqVW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1092927a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746123085; x=1746727885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/c250bKfSNRiwKkLb79liqUyetsKmHO2NIoAbyk4Qk=;
        b=VXVRnqVWkZCuehGYtGp0JhLBehak3Z5WZBQ0/zi3T0CYT5h033H8jL6jZ0sFnBNwF7
         41WGObOZc5Jqu0p5pijegqvqtXJl0SikMzYA0g4eeB0qSBQu0sb4LH+/nBhF0eD8HmFU
         JpMOB1yy9fCQVZePAnShmUK2xTobxqqox34fI6/h045R3b6Hqow8axsG8THJ63ZSbNqB
         dfhmZFUtvfmXTpp5nTWc3eaaqIaTMTcj967EHXKaABPXJNIRuhJn1in2UMJz1RkE4MZ8
         XNhRvkVW7xfHHv0oP0CP8RofmgEsYNN+r8JztiKVFq4olwp8cUkNE0XPkkjtB47L78RZ
         lloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123085; x=1746727885;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/c250bKfSNRiwKkLb79liqUyetsKmHO2NIoAbyk4Qk=;
        b=aeDcfdQ0nwPioKSRSn8yrvvlDBIKewlRACo8oK8ciR5aAAmj8K+ZcURhmWcWTuK1z7
         r95qcCPtvNl3NK6imgEasDFVuV7V6SZnRuoeFiWa6YEFe4F8XWzKd//pK0Yg1pyfvX9n
         M3oNjOKnGDvzyvVQCQdTc5FUbp3tKQTayopmJEt+H8NWJk+LIc6Jrnx9delSHyvWmObZ
         HkMuIHMOnlLIYdj2BV3RwOsy2iBUpKLBYMrkrJMQmKmB1mzrye1OHJV9Y2R200U9+KzR
         5YjU60irn52L6bhfZUwThmj6gxnqi0tVomKJNGZLFoSVPiOhFSv4XDSuox6f/bWUuLQx
         K+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+jMLNl7LhXUGRWkqBWN1WQpblfxTKDLffoQcx3pad8IwxEpmsZmg533tNWohh67MfAkdeh5GAzGEVcyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8/jHECWM8VDwKljnpEGZF5kC4yeDS1YL3ydeNdr297p3e0fQ
	7pAYAtpd0cWGhJlnkqmAMM7cixYE5MkGxeOeFjT5elSQZdO73Sb117K04fxN9aM=
X-Gm-Gg: ASbGncsBZb3osHkOYCmf77NTeCii+ME2uCszI1bBFPnSCedQsqQVEl3Tlxj2DEBjMx7
	x6xrv5bnfjyjsbT722w/ZN0QzIKGoh8rsnTvp9Vy7DL9GytFHD1cinRWgrt1r5bdDyqqjg5ZrVc
	cJi6VTiGOJ0qjFi6/63ap6jP+sl9Qi2Vr8ZkLJkNR9slxsURunHP4eFnkzftDrISO5ysQ2KD9kX
	kjjrDcasgTAD8DqsHA130W1qeJybUy/ozByf/FA0Wx4OaYAFdOcAwR1z0Gjec2SEQ/szhe3IQGU
	5RVGI7AJoukpP8dqOdXiytCRJ/O2Eb0ks3yOnRE=
X-Google-Smtp-Source: AGHT+IGKovrJXgqFnHvlE552aORQpsma/7oOWltj2S8nGTLHFyIF6tsT5L03u3ux/YONXDm1jD+fxA==
X-Received: by 2002:a17:90b:1cc4:b0:309:fe2b:306f with SMTP id 98e67ed59e1d1-30a4e62046bmr108224a91.26.1746123084923;
        Thu, 01 May 2025 11:11:24 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f065sm3937284a91.38.2025.05.01.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:11:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, 
 pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com, danishanwar@ti.com, 
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, afd@ti.com, krishna@couthit.com, 
 pmohan@couthit.com, mohan@couthit.com, basharath@couthit.com
In-Reply-To: <20250407072134.1044797-2-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
 <20250407072134.1044797-2-parvathi@couthit.com>
Subject: Re: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
Message-Id: <174612308409.158405.14880918553210529979.b4-ty@baylibre.com>
Date: Thu, 01 May 2025 11:11:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Mon, 07 Apr 2025 12:51:34 +0530, Parvathi Pudi wrote:
> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
> 
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
> the OCP master ports during resume sequence and disables the OCP master
> ports during suspend sequence (applicable only on SoCs using OCP
> interconnect like the OMAP family).
> 
> [...]

Applied, thanks!

[1/1] bus: ti-sysc: PRUSS OCP configuration
      commit: 7d25c4e23763298f46f1ac955bf9b0a872662316

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

