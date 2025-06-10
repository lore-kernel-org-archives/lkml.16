Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212FE264A9C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586064; cv=none; b=u2MbWY/cRqBUHKYeQV53KG7grAy1IIKRRE1SlhqyMUQqAZ+9PfSQZgqjJJAx5jicNTfrkBX9sX31Yznafks+pNNguk9y0RbwqcE+3OXEx41cKmYY2rspvQcfFJmJsF0abkTIg0NTPJmgXucmEGjLO7ILE7jSEZJQyg//s8YXA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586064; c=relaxed/simple;
	bh=lw5HEHQ7lGuFiyYarsVYoKgyzHF7R9dcveua1GyOrbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4JUTp/FEq2Od+6VfCVMhn8mGs4me7AAwOrU/fh7ZglhQpMHGjpuOvEIgk4zlRZjTmy1gx9USjrwLTUIO1wic6JB+9NsyosEYz1ZdsAONzxmZOjGzJOUlTEn6bVmc4ctgLwxBAOIahaSrgFH+Z09swA8Bl9PpEAwbtL5X7w0XGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ftd3yZwa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ftd3yZwa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33677183so48463175ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749586062; x=1750190862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZG3S+MiGawwwA+EnXpnSVrGI6zVYs0cCjC+AyGKw/E=;
        b=Ftd3yZwaWVg6xhuqmO83j7kv5154Rbxsjk/59BTXhv61LLivofwwvQW2BiR6ovARPz
         4Gu8cidgIU0hT/6HpY+kIj6SLBuFPxynHQWekBH/E4AeoZkQj42Bq5c2ks8pXnMxB/fv
         FizMKLkqy2vJRgXnP4JiXzrvCYKGF0CTWd7u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586062; x=1750190862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZG3S+MiGawwwA+EnXpnSVrGI6zVYs0cCjC+AyGKw/E=;
        b=tTFUrG8pD0y6JAawn+jHfs0gqgl87LBW9dPMF/FyW9SUU362er1+x91EqA/VuIqQsC
         3OM7LUfKOKpk/Us3hN1MY1ne3aFDWs3wFz3vqhvhvfOs4DRtS336x3CGxhqNBkb/XUYJ
         AIiL1WwxOW2VD/KiyOFpuHxdvreTfU5xwaUKLGT7NgMwAsbDE2QT69BZQfmIeD2alr2e
         7GlMFniC+rDTBjynNMY7I+KFRP3NmmfnDx8rli2YyxZFHXC5/WX+PmZZo+k8ASRlmaB8
         UPGWdOQkPR4RC6pgG4E5XivF2ndxyZyMaQqQTD0BKUQIOsLJZa870QnG7ELcmSWgFkVs
         +xkg==
X-Forwarded-Encrypted: i=1; AJvYcCV+dVKg5kR3U6u8PHLsakbUeUYvF8KNiiXkteZyNCUXWf6NBLOxJSY9ol6nSKkpaLqx5MqPEu/iyH/+8Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+hOlgrV+IxirA3gl9ruNjYy7Mw59F6frafUcNocZH1Ji2MLC
	dH8/2BoKnjY2E5Va6y49F11Zg7QUgwwTRfFX1jNaibz1HUe3z/jO7QluGI4+iCQ9S/JjpOsrigk
	Gyr0=
X-Gm-Gg: ASbGncsmdXHwhr4ujPL5H/frxnyaY3EuNFHEtrgCSzf5f381+zbE/rqOOvOrOOPmb60
	J41e16UUdUVZyplqfWjG1x9I9rJf2Q70l+cyNGofxZCXIscyLIILCH3NuGYErIYg2ZwyvzNYalW
	0UdqdJ43HhtXtAyT1TM1Qh56E4QRb1DFaen65inBk9Q28j31A238Wlbv+ZkjdnuXJBtW3cYC9KD
	B04rTrXwKXNaHN/oVzebsBUWe7r1+OX1qtJ6WBiZVLUIiqkMqglhpUDWxKvNEd4IxDN4qUIce4z
	r8QVfmdtCoQAG5yFA04xvUcXtObqE2T300qyLqkwe9ecZ/mfVBaR0c4bHW3+qLtd5cbnzdVoHeT
	4UqIwdF9t6HNHRC7dfCPcMReO
X-Google-Smtp-Source: AGHT+IE3/uMlYM5eemdscOcyG/F9YgtLX8i4MkAFM/pK1oc3p+qFFnk90HoYOouQZBIRu0Gc3DCRTQ==
X-Received: by 2002:a17:902:ce0f:b0:234:8c64:7878 with SMTP id d9443c01a7336-2364260d248mr2018715ad.11.1749586062263;
        Tue, 10 Jun 2025 13:07:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:4ad1:78dc:7f25:dde3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603092635sm74561885ad.81.2025.06.10.13.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 13:07:41 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:07:38 -0700
From: Brian Norris <briannorris@chromium.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aEiQitCsXq9XSBcZ@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>

Hi Alex,

On Mon, Jun 09, 2025 at 08:19:58PM +0200, Aleksandrs Vinarskis wrote:
> On Mon, 9 Jun 2025 at 19:13, Brian Norris <briannorris@chromium.org> wrote:
> > On Fri, Jun 06, 2025 at 02:21:54PM +0200, Aleksandrs Vinarskis wrote:
> > > It appears that this commit introduces a critical bug observed on at least
> > > some Qualcomm Snapdragon X1E/X1P laptops, rendering the suspend function
> > > unusable.

For my reference, are these laptops represented by the
arch/arm64/boot/dts/qcom/x1e80100.dtsi family of device trees? I'm just
trying to reason through what sorts of driver(s) are in use here, in
case there's something I'm overlooking, as I don't have the laptop in
question to test.

> > > With this change in place, after successful suspend the device either:
> > > 1. Cannot wake up at all. Screen stays black, even though PM has existed
> > > suspend (observed by external LEDs controlled by PM)
> > >
> > > 2. Wakes up eventually after minutes (instead of seconds) with SSD related
> > > errors in dmesg. System still exhibits errors eg. UI icons are not properly
> > > loaded, WiFi does not (always) connect.

FYI, my assumption here based on the log snippets and the patch in
question is that "only" the NVMe driver's IRQs are getting b0rked by my
change. I could imagine that would produce the above symptoms in most
laptop configurations, because failing disk I/O will likely block most
wakeup-related activity, and cause all sorts of UI and system daemon
(e.g., WiFi supplicant) misbehavior.

> > I'm sorry to hear this has caused regressions. I don't yet know why your
> > particular problems have occurred, but I did notice last week that there
> > were some issues with the patch in question. I wrote a patch which I'll
> > append, and have started (but not completely finished) testing it.
> > Perhaps you could try it out and let me know how it goes?
> 
> Hi Brian,
> 
> I have tested your attached patch in addition to the original one, and
> unfortunately it did not resolve the problem on either of the two
> laptops: neither managed to wake up, just like before.
> Will be happy to promptly test other proposed solutions.

Thanks for the testing. I've found a few problems with my proposed
patch, and I've come up with the appended alternative that solves them.
Could you give it a try?

Also, if it's not too much trouble (and especially if my patch still
doesn't help you), could you also provide a more complete kernel log and
kernel .config file? (Attachment is fine with me. Or a direct email, if
somehow the lists don't like it.) It's possible that would give me more
hints as to what's going wrong for you.

Thanks,
Brian

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index b0e0a7332993..3e873c5ce623 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -205,12 +205,15 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 
 void irq_startup_managed(struct irq_desc *desc)
 {
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+
 	/*
 	 * Only start it up when the disable depth is 1, so that a disable,
 	 * hotunplug, hotplug sequence does not end up enabling it during
 	 * hotplug unconditionally.
 	 */
 	desc->depth--;
+	irqd_clr_managed_shutdown(d);
 	if (!desc->depth)
 		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
 }
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index f07529ae4895..755346ea9819 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -210,13 +210,6 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
 		return;
 
-	/*
-	 * Don't restore suspended interrupts here when a system comes back
-	 * from S3. They are reenabled via resume_device_irqs().
-	 */
-	if (desc->istate & IRQS_SUSPENDED)
-		return;
-
 	if (irqd_is_managed_and_shutdown(data))
 		irq_startup_managed(desc);
 
