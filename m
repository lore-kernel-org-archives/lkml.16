Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2486E1EDA19
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856000; cv=none; b=joq8f3JeCIPVv7noi7s9QE4nS4/17Bm79FY9jVYYUov2JqV9CKeQvicdIvQ+kVovqFVtw5ZcX8p7WFrKicBNGNLdBGZr93BH1r8vSDC36reeQCzPJau4BaLKNDI0nEAJI1vVIk3hyYcuHZoPq9n4EZjROFLSGvMIUIrG9MRgFVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856000; c=relaxed/simple;
	bh=5aOPdhBZtIBCynNKPuEpmqrL5E03bWDkRVAg/58r15g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sNwchFX31FobC8ReeiZinkPzfBxFmxp4XmHEYnCEN0uEdigPDXcQ7XGFTS5jtOfH7jcu7o9celWgnGL45LLp1HPJ+wAixnt1BPG4iYikjJbwVCO39r39vhHmvbTF5pg3UKDhuLsmhsza/YmT2Cn2gixb/P/piFq/cCgb38NIp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mz1+Uo4n; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mz1+Uo4n"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso2081008a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738855998; x=1739460798; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgsaN7Wto+3sNukyLBJk9HT6xc5HtWWkbRWdPLmCR1I=;
        b=Mz1+Uo4n14T6v8PC4pRB4cNGHF4iIdl+lkZRdNlUclH3cGayjukBWM+8TTqN236F0c
         H4kuffoyDJMMrBrITMa/R8zO6c8kmJjJ0wGVhyn6gp//+uuCKHFxB62uiaykbryEpmN8
         KKEyTxvMGhSdB6n8y1uK7DerFZHZ0ghQxrmVBtF6AfqYBw+2Mg0Y+jK1D995QHuYM2FG
         Whmy8SU2B8/lLX7EFzJFvllmFxHSFN1Hu/Wbccshf+bC0fvgi6slGZngtjQptZFeBJWL
         eBaGwy8Wwx5QV93gY4i7p0Gggr7FdNMePsKJ8PzaPhIMhb0egBO06zMU6LVCTVB6LaNo
         5LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855998; x=1739460798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgsaN7Wto+3sNukyLBJk9HT6xc5HtWWkbRWdPLmCR1I=;
        b=FDOyNcCn957ESqJgMoDBhaNq3ZYYbL0n7bbAv9QeSU0z5pk7rTdYMhR9ryDkd+e4XX
         XoYLAO800BXEktiJq2SQTpqNMDftiOV7c8UxUP7bMTZp5zUtIjrciCX2XFwsNFt/QxQf
         qLsivuSDKF5ICbBq9iGTpcxdoA6I2BWVITUbmTFZRIDV49fzACNoe3kUQhps2RlQvCsS
         nHVMAdlLCv1oNLfyvoiOgbSIpnAhTtMAAocEpfl0ngJIuVzZ0E3BYAFr/zqZ+2kEy56n
         Fspw24W6rbKJMrn0XqjR3ZeJVqY5z2+vil+6/6ywM1eslMra6LIwJPgBSP4+WFuBC7+j
         iEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDSa26Vj+D0hY6OiHkt1CQTL4AF87QHHgaKNYlLYdrtcayKjVRvi5jvD0OUTTVV/jCgiv4YFEPerDVaAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJCzsnh9Sldl0PoFTFO0lzo21fsKRi7kd4q19crmEoKY0VkNm
	wIZp4c1Mw+MBzSxyhbtf4TllrQyM8kskZXSRxwx5xZBkEfxWMddLL1a4hGT1Cvzdpjt2uzHl0NT
	hSw==
X-Google-Smtp-Source: AGHT+IF1u6OBIpOIpnrZB1HXgpKGeOSM7WuMQwKRzm9EJ39hO6kBYMoCI2te/CcX4W7YxjTtqSMtma3kxu8=
X-Received: from pgbbw7.prod.google.com ([2002:a05:6a02:487:b0:801:d768:c174])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:100e:b0:1e1:c8f5:19ee
 with SMTP id adf61e73a8af0-1ede8845ff6mr14157386637.25.1738855998074; Thu, 06
 Feb 2025 07:33:18 -0800 (PST)
Date: Thu, 6 Feb 2025 07:33:16 -0800
In-Reply-To: <5051cfe7ed48ef9913bf2583eeca6795cb53d6ae.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738746821.git.namcao@linutronix.de> <5051cfe7ed48ef9913bf2583eeca6795cb53d6ae.1738746821.git.namcao@linutronix.de>
Message-ID: <Z6TWPJvlQG8F3tSw@google.com>
Subject: Re: [PATCH v2 04/31] KVM: x86: Switch to use hrtimer_setup()
From: Sean Christopherson <seanjc@google.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 05, 2025, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
> 
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
> 
> Patch was created by using Coccinelle.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
