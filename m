Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E42063DB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655088; cv=none; b=Fvxzk8nIkoPG/+41eyybcyumLPmTF14e9DarWxBb79NeG3VyqKH8I/+xn4LIQavELRFG7v5qDRuXNDsy/Q9LbtaP+7yxAgt9UV31lgD7YEITTryfLJLqVNgTSGAB6PS62FWh7vNGoJBQ/4YynKzXxmy+cHa4s97BAfZC0Z1BxbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655088; c=relaxed/simple;
	bh=oe3YIDz7o/JvgH5KNQTz45qsc+uflVhOqAiLwW0pem8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qdA8enKGaKo7KrHxMY+0nYXKtxWWbTR5R8/dvz0PKLPLOIHtQfQYDq90gy1gSt9cwdLGp3ww4CAcg7zPq8DIGuz40gwpQih0ZU7sdseMVRFyPnFvJqmnBU+b2aWy/aPSDkkN/tDTcEZqGqeDvHstNIE7IdLgh35tnzJVnKdPLH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ol8wr/KN; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ol8wr/KN"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-6f4434b5305so31318027b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738655086; x=1739259886; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oe3YIDz7o/JvgH5KNQTz45qsc+uflVhOqAiLwW0pem8=;
        b=Ol8wr/KNval9Ty3M63GxlBSuMjU5wh1WLm7SmeT0QcR+VTvSmvyOoF7TYz+34jr8as
         ua7S4SjVOP7noi49lZx6qrbStggcI4aKLeLfj8YDZZujyA/fgs+0qPpR9DaiFJ8iCPD0
         vYfVjYlC7nKfTR2pTe0aNJCGII7RQTmLFN4DpbkY7v4a0GWr8NC1DR6asb10h24xu7WZ
         6Z2pEpJVF/Tlaaq2IBsM4JBXCcmNn36ugjTpbRdjbblr9W189F4WttfdtKrU6HYttWCo
         7woLu1o+QfnvLYHB8gKK3OJMv9sg6JRhokoPgG8THEvFEHztd6/nDRIliiNrVeSE9JwQ
         0ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655086; x=1739259886;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oe3YIDz7o/JvgH5KNQTz45qsc+uflVhOqAiLwW0pem8=;
        b=f0YM0g0a6XyvAn5t0DSENb+Qvxpy6hq3KRFmsEwNZRz1ihyeq5E99xa+NnDLDjGA1s
         Tz925k1Vjhs/oGAIRrEEUOwuH+vXIIChz1H0MFKKvnoIv4f8BmqsxELykkN38gopsahC
         xJ7WP/b93l5jaTOYZD2PSvX+N68Oj3jTuD+Zqs6vGCsKMTmYSa7Q0asdzEqmE7zi+k3j
         1WtI4DMVnwqpc3hDDLiVtt2acttp72q2lzLqRoIGNaeuGpGDi9ghnW0x3QFPvQ5rM+iD
         H5cvKF88WHQh4V6sa/761VJm7C3nNb3C2dcEju1ENbaSuU2M6M6TQoygABqGimCK1GN6
         3ZrQ==
X-Gm-Message-State: AOJu0YzF2pTKNACaoTgUKRCcKllbDyVqhNm3g3KNZGK20EPEYjdaGUWB
	gh4GYpPd/HvblhaGBfw9JDEooDntR5Z2ZQfQnz+5XEQ0bIP1Wn96/uPiwVxBNXn0RuMDvUgLIh6
	vqM27pJYBV3VrK5jzk+GkhrFvxblV/olj5fk=
X-Gm-Gg: ASbGncswotq/JwEIb+2fd2ir7fFhaEvSHE90eVEfUcmrURLd/n5tkLLVmaRoFoJa+yP
	9uJhoO4hKWNjDyi+dGCscNBWI+tTNX/QyO3T8WUa6dAsut5TG857nNnx83F2S+xZW17lEgUkEvI
	bmo6GhV399QW7V4uBWLm4k/VD9eqywOw==
X-Google-Smtp-Source: AGHT+IGVSabH9p+NfuxjpmXXxSE/kgJnp1vC8KW/SBjQ4Ml/Dm7+JTHrH6MK8FWr6NLCr+BHRo72G21PiLkfb1n25So=
X-Received: by 2002:a05:690c:6602:b0:6f6:d01c:af1f with SMTP id
 00721157ae682-6f7a834f0c8mr187326467b3.16.1738655085963; Mon, 03 Feb 2025
 23:44:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Tue, 4 Feb 2025 13:14:35 +0530
X-Gm-Features: AWEUYZkyzyH9UR-uksif6_SkzGtW2fDr8LELcL5QaKetOf_iE61NUizYl-_3xmA
Message-ID: <CAFf+5zhYVsRQGOg5gGbgHP44dFvNxvGVRvU__38oc1B55_kmaA@mail.gmail.com>
Subject: Developing device drivers is not easy on Linux and that's why many
 companies don't provide Linux drivers for their hardware.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Developing device drivers is not easy on Linux and that's why many
companies don't provide Linux drivers for their hardware.

I will request Linux kernel device driver experts to make driver
development very easy on Linux (as easy as developing drivers on
Windows).

I don't have the required expertise, so I can't do it myself.

If you don't like my suggestion, then please ignore my mail.

Please look at this page:
https://www.zdnet.de/41548848/auswaertiges-amt-wechselt-von-linux-zurueck-zu-windows/

It mostly says that they are going back to Windows from Linux because
of high costs of driver development on Linux. And probably the high
costs come from the fact that they have to hire more than one
developer for writing drivers on Linux because writing drivers on
Linux is not easy.

Regards,
Amit
