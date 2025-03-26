Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296184430
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743024572; cv=none; b=muae3vpkXs7I2rkhC6WMZVwOTgkAXnb5+t9GGVZ12lMXCvrctuBL+oV8H2/r2KDRUDv2uK4ulRb32C/oHeT/3eaXhJ9imx2HcRuWu2cAtanrU4QER2O8HAwImyQfQxfhL31T9/hbEAZknxEJuWHRwPsfuqGFofOpqcbwXFj1elo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743024572; c=relaxed/simple;
	bh=U/QNVHD9GlOlEUG/VEeH8nSY88NV88yWPEcw1EmM+oA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JQVJmAN6g0cqfJYy3z6OTkivFYRdvPE3m9dP2uAjrsHthmYjnzz2UlYoKENHVC9jkV36hvVhqvlHLTf77dQVSUFDgwWPC9wKB9g33mhkQbeTcd+9PPnOnV59pEPcYHhe1qZrio1IgTZlb8dwyuPz7Th5xfqGB0EmwJ1YIW/dNAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--colinmitchell.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y0tBBETj; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--colinmitchell.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y0tBBETj"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2254e500a73so4356295ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 14:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743024570; x=1743629370; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ePkkCPe4N3YuNMZ8IiEAqlfQIXgkmbf4lUcWGQ8Jt4=;
        b=y0tBBETj3d3Thh3EOpMYmJ4uimEeCT8wwPsEtW3ECGT//KldJCNS+wtqjQF/Ep6UuY
         wa8O5SOtMq16N6N9QqSSO2PhGnZDAZvuMnyL3nslMUvT4dd1yCv0+Z58ahsEgVV7q1my
         qrvknF1yFTKgjV3d9vfOLT5L7PxqO7bXxM7PRpaiUzbIHzSVKq/BI6+BtiFLSXGoDYnp
         vd35kJfoEnr3vVJu/kGF+4h6wJ41/Gg84yyZeIPdj48luq3b2CV9sVpInHCghbpsthiC
         YT/XA0jIaIvn2cFXcOiwdQ/z/OYlUNsj0eA5D//wak0Uznl+cfcVzXSuizhhTw4IaK+l
         ITuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743024570; x=1743629370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ePkkCPe4N3YuNMZ8IiEAqlfQIXgkmbf4lUcWGQ8Jt4=;
        b=MXeRI+Yo4TBBizdm46FKRvtPqVchun8GICLn7CYwBO/ipvl71zDM43Hf1w+lmYO6XX
         f0+BkjU2+xD8RywI1achykw/hzsZd8/1YTr7LDBXK151Asrw57OWWvshEk5kq1dWOwOm
         ARTKwlv+qzOsFqrXoRxFGy58qqVBXNcn6VfA2zKjexvc2cjJB8xDWM1GmZOXSn0hfnHx
         gTg4stzdWmum7kOJjR3dM4piz0ru6WMkTXNxexFX/skf/UQleINnesbk8A1Sz9mPW2Fj
         R5DnrkNXp4IZW36tZPJIajFp4LKSoJBYPeN9nytVTtBTW5gF6kmc8xFyTLcRSgBxidE0
         qOeg==
X-Forwarded-Encrypted: i=1; AJvYcCWbAGJ4vjktgHENVHItox7fjv4dzJqxyvo7sdMr7y6JoEf9fchj/BvZsX1PhggkWkjkhJcQmVGzovcbFfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwESLR1dOecQLp7n80Qpo18MZlGNG1djDDnjW4xu3kjHer/lLDp
	+lrdw0BxyvsbAY2MKRgAVVf0s2Iro/yOOzLiYNMgc0ykYakLBBWZsiCmT5gCHZyvkl1XzAQjyqX
	qKqKAqY3rMYqcFp1TXkVmLduXSF36CA==
X-Google-Smtp-Source: AGHT+IECHrGH2YtJBZxqnBaK0vvOGtBKjm36ZJE+wsbQNbDv3xVBnCGsaqDsSmtRCMheHW1Yz5R+mY6VPSt//Quts2Qu
X-Received: from pfbb8.prod.google.com ([2002:a05:6a00:ac88:b0:739:3659:ad9])
 (user=colinmitchell job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2290:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-739610373e4mr1354749b3a.11.1743024570397;
 Wed, 26 Mar 2025 14:29:30 -0700 (PDT)
Date: Wed, 26 Mar 2025 14:29:28 -0700
In-Reply-To: <526df712-6091-4b04-97d5-9007789dc750@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <526df712-6091-4b04-97d5-9007789dc750@intel.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250326212928.2360063-1-colinmitchell@google.com>
Subject: Re: [PATCH 0/6] x86/microcode: Support for Intel Staging Feature
From: Colin Mitchell <colinmitchell@google.com>
To: dave.hansen@intel.com
Cc: bp@alien8.de, chang.seok.bae@intel.com, colinmitchell@google.com, 
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> On 2/28/25 14:52, Borislav Petkov wrote:
> You can't load any microcode anymore if you've disabled the legacy method
> too.

Staging, if I've read the code correctly here, is only used for late loading.
There is performance reason to use staging for early kernel microcode 
loading pre-SMP. Therefore, if staging perpetually fails, it can be applied
without staging on the next reboot.

> On 2/28/25 15:23, Dave Hansen wrote:
> You seem to be saying that you'd rather be (for instance) insecure
> running old microcode than have the latency blip from a legacy microcode
> load.
> What action would you take if a staging-load fails? Retry again a few
> times? Go back to the CPU vendor and get a new image? Or just ignore it?

That's correct, but the latency tradeoff scales with the platform specific
size of the microcode patch. I'd prefer to have a more deterministic
update path and believe the potential latency blip would be significant
enough to justify the option.

Adding configuration would allow me to handle the error as needed.
A retry loop would be a first step but I could also look to migrate VMs
off the machine if the platform specific latency blip would negatively 
affect sensitive guest VMs. While an ideal solution imo would then
allow me to force legacy loading, I could also settle with it being done
through a reboot where early boot would already skip staging.

