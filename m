Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB9230BC2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914454; cv=none; b=PRB26nCPJUeQJZesZPt+59FYm/Ifuir0AU2r59+QpgAEojw6DiaJbdtOfpEZkisB9cY2KOnG5qTzhYMQLShkuNcaEEt0e1MxbZlK3ryawOARR6Zp/te42E5riK1iykK7B6KO5LpcrIWQ9ourb2DWwhMPlNctrmwJvYyuRwRDF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914454; c=relaxed/simple;
	bh=DtQkUHQiAtMZoY9LNzs7hqcdhXOPWRoXKiwfHlU2cu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e21C9JKi/scG71nKBH/+RlKRv7w29M+y5dUCIJYxHT2KUIkClD+CnbT5llqGAVlA0cb7XmqtIfb6aT0YWDY4kUE3fRGxNGAJa0VWAtTAGB0CC6Hp/lJw7QoASwPgc43NcOji6P86+laQqSXRKXLmTxPJkjbSriFqBuQUoYccXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qqlkcg7n; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qqlkcg7n"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c27df0daso4367172b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747914452; x=1748519252; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJ1gudwiHyu+TUV61FEDK/7QlJCEvUcmgmmYX9winDM=;
        b=qqlkcg7nkAkV+Csuzke1W93Z5DxDzLS4dzKMAuFeNiUvzlPwW+v5vqnmpagddFjtUv
         de+xp5LABTbpKga6iwteixLQqLBP/jKygw4o/X0QI4EhCoh/Ihiyfiza/XInqGT2U24T
         A6wfZTzHPBHqDiejZDDWu0LjoHPpIjFL1sagE7yJiuKWcsL/uvUOX8of5JPcI8y01IsQ
         Ekwm+itSY1rH0c6oTW+p0L6jLrjMbA8gXwHdMB6SZBdH6zBIJRzJiJbMQro0pNjkaAa6
         GKXkiHzZMd0PQwAo4QpDmGo0IIctqoToEZuhYEZuIMCNvDeFJSI64AtwD/lKEeD8p2gA
         2MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914452; x=1748519252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ1gudwiHyu+TUV61FEDK/7QlJCEvUcmgmmYX9winDM=;
        b=F98lzN1VOpy0fx8bweRKk6PHoAT/LYdLgQa9cq4DeYy5+CRRK3KIrelF2OMaNIHiYv
         44wWBlYd1nvOrJJXzBpaJa+A6R+SK4OuXsI4fho0JvvwDLJSOAo/uavIufqBgMkLUy2C
         H7KJDQ2Z/1aqhLHLNX1QnbsMgPDao0pa8f/KiSVzjOiQbUhWoW6wLZIum3FCZOdEIUkZ
         BqzihP6vGEMg/31H7zgzeJLgECnpTKKvQSVUevFplQsqLHANTp1GYNdJZH/KzSgRE9H8
         RgVixEtK1Qosz49Pw8Fq+NR7M2aw00SL/rZFJW6iaIw7dQ1aTU6IqXJtCAyzSKJuYbFR
         4Pvw==
X-Forwarded-Encrypted: i=1; AJvYcCVwnfVDik6u3mnr5ashKikQ3kpTxsOdrP+R3Zt5/kWyZVsJATppqaaIr310owE73eKxVEeBqRQC0pMOs1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSgM7F+AWHMuikkkiNEY2UGj9o6cIAj20h93FIkrGwQAFh4vo
	idCT9yhtpTaaHavmyuTu+BT+TTxzTVF2KD4qN6meuZCEr0NqZjEMfwpZAAkAPXTjjw==
X-Gm-Gg: ASbGncth6D9hMppf6wke3dl6sgiGGhsdFcNfWEkWC3ycggNIciTmArq6E7AGbHG9s/p
	G7q5+YBC7q2wfq00NT5zwm3XmaNzXs+B2vm3s/bOKrIQ+/4vssVO08hlWP9CECeaVKo+ExJw7MR
	1GfKwz7eYlhVPX9Q9o9A/KGBNjer4L3+yhsgM/Lxgxhe55F8GwrYoELboO2BRDSvbF1bTL+DHv4
	puPxd6MojPvaidIlIdHkkttZkuxNWdMPugAhAgJ/Fzulhkc8CxiTDAjPu6AnRDgN4qRKN8tJYeR
	lYFkNkLhmQ2e+CtDqyMSUXTTFiwnYGJxsF8autxGlFsSOmxnbFSEXh5sjKfe9g==
X-Google-Smtp-Source: AGHT+IHC0b/jva12Q7TKdRYGBUhf44wv/UkRVQDXr+TC6tXwIOo1ebhkI3CtBJXlt3OvApFzHql4fA==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr33151680637.19.1747914451678;
        Thu, 22 May 2025 04:47:31 -0700 (PDT)
Received: from thinkpad ([120.60.130.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm11140491a12.18.2025.05.22.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:47:31 -0700 (PDT)
Date: Thu, 22 May 2025 17:17:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, tglx@linutronix.de, kw@linux.com, 
	mahesh@linux.ibm.com, oohall@gmail.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/4] pci: implement "pci=aer_panic"
Message-ID: <e2iu7w3sn7m4zwo6ork2mbfjcfixo5jn5ydshkefezsgtquvh6@kjdvxgiapbjj>
References: <20250516165518.125495-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516165518.125495-1-18255117159@163.com>

On Sat, May 17, 2025 at 12:55:14AM +0800, Hans Zhang wrote:
> The following series introduces a new kernel command-line option aer_panic
> to enhance error handling for PCIe Advanced Error Reporting (AER) in
> mission-critical environments. This feature ensures deterministic recover
> from fatal PCIe errors by triggering a controlled kernel panic when device
> recovery fails, avoiding indefinite system hangs.
> 
> Problem Statement
> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
> traditional error recovery mechanisms may leave the system unresponsive
> indefinitely. This is unacceptable for high-availability environment
> requiring prompt recovery via reboot.
> 
> Solution
> The aer_panic option forces a kernel panic on unrecoverable AER errors.
> This bypasses prolonged recovery attempts and ensures immediate reboot.
> 

You should not panic the kernel when a PCI error occurs (even if it is a fatal
one). You should instead try to reset the root complex. For that you need this
series that got merged recently:
https://lore.kernel.org/all/20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org

PS: You need to populate the slot_reset callback in your controller driver to
reset the controller in the event of a fatal AER error or link down.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
