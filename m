Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319202E645;
	Sat,  3 May 2025 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746233913; cv=none; b=n4IkoSr8uuxWO84CKSzSEc9NaBvcn4IC6PsurPUFUl2Ufo1x8ahgGZdqqNu/0SnkzCejgxfjdn3LGGEepv4LO+MGwG9WlTq1Van5ABvmA/xCbU7dtx2e/60zu9AmTID3EH1VUeKtrzjYCuGmU720+TK7KmNPg7wupfaKx58qRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746233913; c=relaxed/simple;
	bh=NelxhxA2brLaj9mkGx4gim0g538OqrsJ1Ezvn6KqVKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7LqGP7P/gu8xEcisl8cVvQtiCVRqQDE8v+DG0MjuRJkofDR2MizlMPkw3xx4R/htb2WxPqpI31m3C0+ozLjoMBeA2yNvsumYG2/nLJepHklYk82lZYGhc0kS3nNWsDQxW0mzSM0g0YWtPpmHJrV12AiLKOUqs+2VLSH9v6myaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLQurU98; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLQurU98"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so5080903a12.1;
        Fri, 02 May 2025 17:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746233909; x=1746838709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKpuVnvGd7lDlqZRr06ArGAIPOrdgharI02KJ8vLSvQ=;
        b=fLQurU980Eh2H0Ul4GqVMFLpBEFLLwAkdp/HDbTxoQ/T8cd8FJvqenYoDZUSE3q8yw
         fAlACXWkyrllYmSLbG9dErn5g6BkeQdZcyoi5HQ93ptDGOZnydmJr4NlsoNnWcH3mfqM
         YumuG9pJ9uWLSNFxr9M/ZNq/fY3NB2eetv04tykqoNgnhuqKOjsMR/kunb/knDhh4mp3
         cr8quqoooV1rV9xddRjx0qNshfH8RrqJiD7ZzQ6zSYnx55mmzczZusjSvYLiWq++7BsQ
         y2UW3wGzRHovQ6L2QgRXJlbXdp0RQ+CvtWgtxXXlpJkKv3tGW/04KU372SB5e5nQ/u/i
         8KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746233909; x=1746838709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKpuVnvGd7lDlqZRr06ArGAIPOrdgharI02KJ8vLSvQ=;
        b=u4P8uDYkZIvTN+RnyTKsq5Hi2+St3mYRfIMCyMlXbyFUHrCltX8L8q/i/3YDCsjs+b
         KAyO+qDxpqPxB4g5ophm5oPkGC4yRiSNZYa2F8MtvbkSPeMHRa50ShfZR7x8LrdP61gi
         XD+E6xW9azU9MJMwMrmv1qHKTJZDK82ksSOgI81Yw+wyIFCKWz1fi9SMzw73+S3i4IkF
         gpRn1VEITTVA6EnWWzXyxugQFhHI3PdFDNKFY9RFrBHZ2s1JMxPsoQ3Vzl+8NpJcWtnO
         WbICFSFQ2k1mtAXa+EPkmsn/MK+h0E0uOGG3YIrFUI7WoEvEqmxIDZUo5Gds2JX4vRpA
         bLeg==
X-Forwarded-Encrypted: i=1; AJvYcCUxJCxzqtzNa3NlHybH7AJvG1BtkaDBo8AtOJixpQ3y44oosCDS91ZYqlmxVrl85sUZRi7regbXwRExBA==@vger.kernel.org, AJvYcCXPZ5Luxr6zY6Qoqpbv3vFuExomwNC6qZnfSZ+OXzhfyb5intVZ02nmLUDtczeAu7waeTXty8Fs7A8015eu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2IGNZxHncMQMVoBXJhHixx/4ERgvTD2N/wdGnELenZ3rZjj+
	f2KbaEF4evoOOeuTdWVzxEgwQTj95cfMlEOKbZIWKTaitZxxABSG
X-Gm-Gg: ASbGncuReCxfLvKvvlz+ry8O1/8Go9ePyguVHHQQTcjgafeXDT8N62vyYNYtnMzj4C2
	qjPPCiNaNeD3chmNCsjYqB3WN6Dcz+lMOJgJg/mLpOjq/rBwYhys6WtpvRGgd5uvStP6/3B1ckb
	6kvLiLj3gburkISY4/+wjTyppVsiRois0yjmSMBKihm/wffkS+zopVIjdwZDOEZOEvoMIqAFVAC
	4W7ShupMZbs5AVUIsGPGqs+9i3SREJlMmgSmGgS+igy6892WeARSkG2LlBFDsuPba71UO4LWnpX
	JZ2IAi+XSjWE8HL9JYXE4otMjau8aIk35dc8180VbR6Kz6jEUVdCjnDYVvFeEaKC8fLV5EGSb6c
	Pncligz4nG+vaMdKf2SQ7QZZSY9o=
X-Google-Smtp-Source: AGHT+IHapbeoTS39z84uwW2wovhCwFdtNV0s5AfE31ezxCF6RlFUwijhewHJ38X5magRkHprboCYsw==
X-Received: by 2002:a05:6402:5187:b0:5f8:e330:ff3d with SMTP id 4fb4d7f45d1cf-5fa780261b0mr4235478a12.11.1746233909168;
        Fri, 02 May 2025 17:58:29 -0700 (PDT)
Received: from localhost.localdomain (host-82-56-126-113.retail.telecomitalia.it. [82.56.126.113])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7775ca27sm1967571a12.5.2025.05.02.17.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:58:28 -0700 (PDT)
From: Luca Carlon <carlon.luca@gmail.com>
To: linux@roeck-us.net
Cc: carlon.luca@gmail.com,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lucas.demarchi@intel.com
Subject: Re: Suspend/resume failing due to SPD5118
Date: Sat,  3 May 2025 02:58:10 +0200
Message-ID: <20250503005828.6128-1-carlon.luca@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <4e0827d4-137f-465c-8af6-41cc68ddaa8b@roeck-us.net>
References: <4e0827d4-137f-465c-8af6-41cc68ddaa8b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> From the context it looks like the "sensors" command was never executed. To get
> another data point, it would help if you could load the driver, run the "sensors"
> command, and then try to hibernate.

Hello,

yes, I did not have the sensors command installed.

I removed SPD5118 from the blacklist and I rebooted the system. This is what the
"sensors" command is reporting after the boot:

spd5118-i2c-1-50
Adapter: SMBus I801 adapter at efa0
ERROR: Can't get value of subfeature temp1_lcrit_alarm: Can't read
ERROR: Can't get value of subfeature temp1_min_alarm: Can't read
ERROR: Can't get value of subfeature temp1_max_alarm: Can't read
ERROR: Can't get value of subfeature temp1_crit_alarm: Can't read
ERROR: Can't get value of subfeature temp1_min: Can't read
ERROR: Can't get value of subfeature temp1_max: Can't read
ERROR: Can't get value of subfeature temp1_lcrit: Can't read
ERROR: Can't get value of subfeature temp1_crit: Can't read
temp1:            N/A  (low  =  +0.0°C, high =  +0.0°C)
                       (crit low =  +0.0°C, crit =  +0.0°C)

[...]

spd5118-i2c-1-51
Adapter: SMBus I801 adapter at efa0
ERROR: Can't get value of subfeature temp1_lcrit_alarm: Can't read
ERROR: Can't get value of subfeature temp1_min_alarm: Can't read
ERROR: Can't get value of subfeature temp1_max_alarm: Can't read
ERROR: Can't get value of subfeature temp1_crit_alarm: Can't read
ERROR: Can't get value of subfeature temp1_min: Can't read
ERROR: Can't get value of subfeature temp1_max: Can't read
ERROR: Can't get value of subfeature temp1_lcrit: Can't read
ERROR: Can't get value of subfeature temp1_crit: Can't read
temp1:            N/A  (low  =  +0.0°C, high =  +0.0°C)
                       (crit low =  +0.0°C, crit =  +0.0°C)

I then tried to hibernate. Hibernation failed and the output of the "sensors"
command did not change.

I also tried to rmmod spd5118 and modprobe it. The output of the sensors
command does not show spd5118 anymore.

Hope I did what you asked properly.
Thanks for your answer.

Luca Carlon
