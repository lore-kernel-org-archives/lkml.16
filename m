Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246D2AD0D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775241; cv=none; b=Luy1H7YR3eCHYjke6dJTKaW4nhBYjziZp+TMtVFnza1UE+iPPCyYiobmNSXXUqdauOZTtpLMFB0QIo+pOu9yYJbvwrUS+CR+0aWN2bsbFoMY2gdgqL5MJ2bDQtPkPpP+/tiGqQ8qsMdTQvOh/uhEp4eHbIMHMuGsnOnnGYGQij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775241; c=relaxed/simple;
	bh=E52sUhwrPT88c00/iONr1WsHW3o/X2f1q2URFxRkf6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CGwFIgQMktdw75KjiR49APOBJcvFGOTVNj/I8buIARnKv6fKkMomm6CmCswpF9KeAX0EDmNvmW6+q0L6oF9zFamScqAF+uN8kMrm5tlao9BpdmUZHJMOMSHOoFlhUSMniG2btj/BNVaKsizUlk875Neb4j+i/+oH0hcRudR5b+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jM9fwDPO; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jM9fwDPO"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5f92fc82c39so1728064a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746775238; x=1747380038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E52sUhwrPT88c00/iONr1WsHW3o/X2f1q2URFxRkf6Q=;
        b=jM9fwDPOul0Bj3bU7KZJTwktSAeEEZVoC0LPaXUGVqfqpTU0Bn+AKKExoCf34IHBKE
         Y7LtK5bdjmAPREiJiv2hYYuN3D6ueQKWgfDcyZieP16eh8R7sy2rHqkmvDM9QfiO/Zup
         CexSn7GcSpP4IdoZBoPkFtnJFNpIl9p0agT1vpA1IhM7q68Pl12OOZkKAfdwiadXi7VO
         vFNl5Au7X6/zURpqNXe/qj17sqStx3YeSNG0hULIYNlvAjRaVpf/39ukcbv0g1Vd/HKj
         0JGibf/B0fU2x5D2oWu8/nMXwO7pEWzEpMHm8oqpZey0CQEsufHpjhJh+h5//V7QKT/H
         J8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775238; x=1747380038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E52sUhwrPT88c00/iONr1WsHW3o/X2f1q2URFxRkf6Q=;
        b=BxA7gzNI1V3K0Y8P0yoTOX/BKNBdWevNsAMy2OGne9kTUGpw1iHJkdj9MV9y5bwfgr
         Xbi/4s2xOlfAt1kfDrZUsKCQQL3INGjnkZLzcMr4qxRi+easw5Cgm8nf4CNadOsAl/TE
         zdAO3/T4WY2PAeWuRm5Gg7LgXRuXoc+Z0KWhNVBNQ9haD/WWP9uvedBGcZugfmJ10J7d
         TiBWnSRYz/3XvsA0dtuW+i1oM+UDkrlNHbzkSB++G6OwgRienSy37PhgN8uNfP3wMcXP
         KqcygP3/dhDThBkupQvj7PDjiqwEwhhjA4JC2rODrKqOj7BSbM6VfJQgMOuESiKsQO1s
         /ynQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+8k2YOJJ2zpvq7/VYgCJqIeb8gX7o9ux0PLJw2tSujnNYvzGzrTm6VyNQU7DoMYXxlnXRyAX4S/B6Cd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIS1q/qXstSbqrYWQDwspKUmzP4dhASL4ExFO7IJ8tQQunMszf
	8hOYqc/J7TPpNmZ164EUAPOm7kcTw1Rge7YYMxQqZbCk5AZllXPIC2VGlWk6uT3WKNR1LR14EqE
	VDhTSgA==
X-Google-Smtp-Source: AGHT+IHudBw1Bfd8zPFPws5wwuo3sjzx9KmyClmMQ+BvrIpmJmJlojWkYFBO6H8lDZOgjAqcWyzvY9Csh0Vo
X-Received: from edbig5.prod.google.com ([2002:a05:6402:4585:b0:5fb:f13a:53c9])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3483:b0:5fc:9bc3:9eab
 with SMTP id 4fb4d7f45d1cf-5fca0770899mr1674022a12.17.1746775238596; Fri, 09
 May 2025 00:20:38 -0700 (PDT)
Date: Fri,  9 May 2025 09:20:33 +0200
In-Reply-To: <2025040820-REJECTED-6695@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509072033.1335321-1-dvyukov@google.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
From: Dmitry Vyukov <dvyukov@google.com>
To: gregkh@linuxfoundation.org
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> CVE-2025-0927 has now been rejected and is no longer a valid CVE.

> Filesystem bugs due to corrupt images are not considered a CVE for any
> filesystem that is only mountable by CAP_SYS_ADMIN in the initial user
> namespace. That includes delegated mounting.

I wonder if this should be the case only if the image is flagged by fsck
as corrupted? Otherwise I am not sure what's "trusted". It's not about
somebody's "honest eyes", right. E.g. in the context of insider risks
the person providing an image may be considered "trusted", or in the
context of Zero Trust Architecture nothing at all is considered trusted,
or a trusted image may be tampered with while stored somewhere.

Without any formal means to classify an image as corrupted or not,
this approach does not look very practical to me. While flagging by fsck
gives concrete workflow for any context that requires more security.

