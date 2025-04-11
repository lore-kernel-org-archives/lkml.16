Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0A2586FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400418; cv=none; b=ItrLoj65SFARzANszy3qebarZ4pS5qAXIA/+ogcjWG2XFAzlhOFLnqnAIG9dbCnFp3ogB0PE12362MVWhH0OWCoyQNLc/rZ2Dm1dRWF4Km/2CTmfuYQcuOEvtndQn2NXjINi631EpplvhFmkAQG6/vE4cTtbjZ54K7h9HjPj8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400418; c=relaxed/simple;
	bh=h0yUKbaeTnHiRN0IWhweIUyHjDLUg3Vw/m7YMO+owbg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WgEBfcsbb2vQMX/z+UHrBwN8JMS/rcijZa24QLpEgtMD7KyQyv4du+rfpgwg2wMFmmpf2EJ98oWtCnw0+W22L8fdS4fubT1Rz0bAoXdrkYzgnW2/gLbbHo8u9W/qBQ92l852kmSPTu8VyOXq55v3C3E40fUyv91uBFIgbfqvSm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqcoKObp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqcoKObp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so4270518a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400414; x=1745005214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K2VMaKkVZcN15rhqWxj5u4DC0yWa0kUY3HocTYBRLz0=;
        b=lqcoKObpIZ+jrFjTADuI6+GCkaxhHwOh36SKKgVUbQ9dNIhgW32mkLdqk8TtGeXnRk
         3ezDAPBEynAt7FNoDclH1KdNtlTwb7IjDooJoJsLerD2Y/bLDC3F4IQb2RahSakp48Co
         T3fA+t3Tcvb5Se+NduxRcIkjAc1UinBoxIBpw94xSS7aPaeBdKVk3n3SZa0d+4x2fxG3
         BKq/WYzdwQGYyWKf62A9PKXjduvoCgnIs+dgRXrDniIBKbM3+GdiR633xo0iJa8KRIxL
         3qPFlga4v0YinmhWONvZlcLx6fKttuh/IVb6Y5En99XIHOenphtj3EYnhkHMb2qsppii
         BHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400414; x=1745005214;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2VMaKkVZcN15rhqWxj5u4DC0yWa0kUY3HocTYBRLz0=;
        b=Mdn/aLVquETSmntOviUfycRafkP9pePUlSihAUXecD5QN3zVleBUhoA/vxBmWtsT81
         boAuAIPoVdoYZysq4dYa3GOOOApYWGI/ZFXhw/s7RucU7oYrGFB3hF2TBaPrk33Rsg4t
         VCaqzQFYM+nK/8SxkiODrjXCeA7XRnZEoCXnwMw03rXwmgD9WzZBK2uoXVsXPyNRRnTz
         l+mV1DN9FkCHbXLkJgpGllR7OKnITwyMi3IEPAf7fOyGqb3vnB/qFZFDeJdmr5zEp7MA
         G2geHCFE+mDYxuxnSgGzChyPoAgu1G8AV/MQmrYinNsPsRei/rsUXMQBYSdKj0isWT44
         6mFg==
X-Gm-Message-State: AOJu0YzpKJFLBU4rSmvtTdAFEv6Jm7lQ1Hv44NdyvB2Sk1f0pk7J/8Lj
	Wa4EmitQYcUIAFKDUxqGqAOajc5b9he9belO4seY1ro+2T+ueih3yauaBh3Cb49uQ2JqYoDOGJN
	nTmlSor7u/ofGHtVv+DpD5SLXnANTMnMUaw7uwg==
X-Gm-Gg: ASbGncusTgys863kLJAwIKo5kMTGzBtOJBwZh79poT7y3Y+g/yqoAR2KBRDm+41/H2k
	SgdFNYTve2BGLZZgBwcepVshfxSXxkAGRUOIk4gtLaLTvTXF0bwcGluoUGrjXA9MeGhoi1tqJD2
	Qa4b103knITpou4EE66h2Qjw==
X-Google-Smtp-Source: AGHT+IF4GYME+04jtmqP0MPVH10BWmMQJzJwCpJ3y0eG6iQYAbWumVzOt098mftPKd+kiFXAOKlvaz4R/Df1ghILid8=
X-Received: by 2002:a17:906:19d3:b0:aca:e2c0:ec3c with SMTP id
 a640c23a62f3a-acae2c0f7bemr58825766b.45.1744400414225; Fri, 11 Apr 2025
 12:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Apr 2025 22:39:38 +0300
X-Gm-Features: ATxdqUHZX62PGxn-BFtAdWWlIs_MRLKpaD00eb9nmzoCWTXCtihzceX6DHl3uKA
Message-ID: <CAHp75VdssCM74oji59QjPMEzrVuBzPOAMadA=Ds_52hOZGJ2mw@mail.gmail.com>
Subject: exporting a device type
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I have an issue with this change

https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?h=for-driver-core&id=e86cc69186051d7312711565803de586efd9b2cf

(I think you haven't yet sent it for review, so this is just
preliminary look at)

The idea of exporting bus type will open a non-reversible box of
changes when people will start abusing it. Instead just provide an API
dev_is_auxiliary() as it's done in other subsystems (yes, I know that
some of them are still exporting the type, but it's most likely due to
historical reasons of not thinking through it at that time).

-- 
With Best Regards,
Andy Shevchenko
