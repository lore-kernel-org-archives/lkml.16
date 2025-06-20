Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98323CEF9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457920; cv=none; b=pZj6eq4+hIgNdejeByB70rX9exZ5LRbyKvu9B9FFRrQQvF0SjWNcZiFo12YyUReYPvHuIXx+hfSJpjlP9CFp6dW8GqdQT7YaiEjUIAjA7tSv/9KOfbmZ/OehJ3j34y6Wlit2jZ9C/gel0kn1p7euOVVD8VvwVUh81/yxBm/swZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457920; c=relaxed/simple;
	bh=ZTAgaNMzI4qiekOqkv3pNeLxj5wOqxlFzSL0ObZQoaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tkfGBU4vELfnsKbObI8CguOlDqm349Jir2Wc1c5of96vmzlVVT1DT/FuO/X9YhK33SH+MYM2TS7zyqTZyWtB0B6ZH5aAdcrZuF7vAoAM22kYtJC3+Tn3j0B/Gweo9un2qJbVIjGkii6UVtjunifsgeszUs7XAbKHfAw/IrqsNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1fTMjpl; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1fTMjpl"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso181802539f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457917; x=1751062717; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=;
        b=B1fTMjplXpGS1iTbK6dYeZ95fWN25oPNuUEbaLnxmiqKHrvP8hGzncZCU33rzqojcg
         uYmnJ1g+kLVwiCdMxgEeuptR2jPqu8cAKAtFlqFVlTXogG+MpLeRWABIeaE5neV8BxAo
         NQz8QLdEVf59XiyH13SvbeOAq3n9oK0rRM6eBZamwYZ8RgoQ5qSsaPNIGfSQBG3Xgcs3
         zX4qOxT6Hm4ET9WfOW6KlTX/PAa9qArUfOz0ZPcMHSet9ckoLHrh9K9DhpE8mXUywYhr
         NSmfD1+kGK0XIpfVQCWvk/RtW/ZEeOO/ALT4Nf4uKW+eHq9VZjkYtdyLnyotyzMQj2ZU
         Kmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457917; x=1751062717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=;
        b=BxOTVnfzGSCJh3bzCR8XASKN8ySMJPlU4G9yN2NWLVnWA24RVWaWJfQsm9bE9bLxIs
         NfPWiWfTjSYceldzvN06VMQyk2nVRaxAqzytPAKOyJCov0yPo2EjvpGBwmsDg6VIUIUF
         pQL6wBccDpxylp0fhYpoZLofcJLJGUxEMWfjsrx1pvwvZsKraspDwP4GtrDAxhyzYVp5
         7eSjh413omImw2i10UJaV0yWNTmkvZi6mW+Yf72Z6EPamqGGXhjR0j1mogcO83twcGeH
         o1qmNTLkfP2vj5LgViXl3sD4WJfd5um2qrjOgMNO8Y0S2r1T+DagG7EchO1qNxTLS2T6
         DgNg==
X-Forwarded-Encrypted: i=1; AJvYcCWkSu2k1hfKhFqDPp1owWWhOlanECoedFjYkS3goYYF3yCBz5B/efNttqTxXiDCbL+4tS8DvJqyQSddazc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBInIw01OMtOGWBqOvGJkoyrBkdmASz1Zhs87SESHoFO9SIJn9
	0SjSPUr0Hetid1KlRvxzy+I/kFUB+IY/iw4gLyu7BwVfOV3bNQJj+he5XlQ3R31yL0eYRqFXMly
	ps+4Xb3q587W9/mKAd4cqdCLfBA==
X-Google-Smtp-Source: AGHT+IGjEFFNY2ukf5QiVzn6d0Iwii2o/2bYlxITJ69QjxdmPFLoVLBssIQF8Rhp8gGY8wow9/U+VX25kMai0q6pUg==
X-Received: from ilbee13.prod.google.com ([2002:a05:6e02:490d:b0:3dd:bec6:9d56])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1646:b0:3db:86fc:d328 with SMTP id e9e14a558f8ab-3de38c2e1c2mr57720245ab.5.1750457917550;
 Fri, 20 Jun 2025 15:18:37 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:02 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-3-coltonlewis@google.com>
Subject: [PATCH v2 02/23] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

There's no reason Enums shouldn't be equivalent to UnsignedEnums and
explicitly specify they are unsigned. This will avoid the annoyance I
had with HPMN0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/tools/gen-sysreg.awk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index f2a1732cb1f6..fa21a632d9b7 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
 	parse_bitdef(reg, field, $2)
 
 	define_field(reg, field, msb, lsb)
+	define_field_sign(reg, field, "false")
 
 	next
 }
-- 
2.50.0.714.g196bf9f422-goog

