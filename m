Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE3DDC1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797699; cv=none; b=PKhtF2FSx/zpDstdZvZdcDd35rpzhKTIgThqUbv//gEQMbLjHk3E8pn8bQeDor7JdgKb1yu+eBBikYw5IFh+s7Kcp7A8T1cfc7A31CXpuakGTG7mCpRfGvHwY1+lH4CsDVoW7uAuxvjXV1/EUVCMZzhWsZho43FPoJHUGU8qjRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797699; c=relaxed/simple;
	bh=V5m9fSkc1kiynvrvuBLYgb6fQ4DQ6fsXJBRBsZ4ixTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DZ6SdTyD7ZcRgKpzsRd0o7aPJRMvfzLTD3DcfBe5qzN6GFLZ9lpnQTGM5sithVyscs9GSEQ4GMyjOdhHro3/NbZuheWD4D6HD4oi95vShhxfHAN2ydOi2L9RjirqVGSkBVBI4l8wBl+oA/zRG/KBDFmtVUgQFyLOZqqOePq79YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CrfK/DUb; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CrfK/DUb"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-223f4c06e9fso23020145ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743797696; x=1744402496; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/FBk6NdvKrMWCu3tKHxufhADR2ZSaIO/oZLOZ9EnxBc=;
        b=CrfK/DUbCiz/+nVD77uX8h2LWpxncov88glHg3H1/azNxvjCA5GpnpmFyHVX7AP4dt
         DCR9jRcdqVtuifJdgHJDd8edXw6iBMWepr6AG3cAWxcSl6Ul7H0HfptKQNOvH3wudqUQ
         J4ej8ScIsvHvM97rpdMA7CnzGzT0OfkzHF4KRlu9LxAtKEpDWs5k/3xhT+0/yiv8tEoG
         CiwMxZQHn5R9hUEsGFRZonzAFHAKZiFBOjSrtnjOyuFD0XzTKjS8As117CITEmnNuVfN
         cNMM/vbFbj4Eg05tW+1Srt77BMVybg00UxOb+aew2jSaPP3kfxKk+hmi/Tt5eLaoFfmU
         qSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797696; x=1744402496;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FBk6NdvKrMWCu3tKHxufhADR2ZSaIO/oZLOZ9EnxBc=;
        b=fjONIQTsD0cINKZfjPf6jMA2/pT9PWowtwgScCV6Gp4+RbkCN7IXZXDexCNsWAGNLd
         BwGAvaY/y45jnrlxRfNMYvpMMtMot7a2C5p7tzk8fUaqLywYYVt+sgh7cVJ5VtbOOrY1
         NLtRq8JZ/10oMt1Hvpqn18mo1udlQfzGy2lRcIiVhyfsXM603TrKU5Cx2lXOTNMkJfSD
         N/xbKtyXUXHTq2mtjfC01kNTgidv7g6YPcRc3RrUk3Ff7K+oxT/wZIVps6p1tMs+EiR+
         fZY5xkBkQmE6WlftQ0VKauAy2q9YXM0eiXlkMYl+3owmO4kUU9ICcxuzrklkK5bCho/R
         tJIg==
X-Forwarded-Encrypted: i=1; AJvYcCWyUPeh9S4cuo+3B14Nar8sB/xw8iw5Gc/QhO+zm7/6XKgWvuRzfKHPIHT2aqC4dDksSYhz3hKjqwkGaok=@vger.kernel.org
X-Gm-Message-State: AOJu0YydYy/odyfWFwLTAfmEEx3+wFeKH1ID31atqJyJ5JbcfayvxFsN
	agtG2igsK45FSRdY+ZH+hT//4MJemf0HC8R52FG+MKfPgGV2hKjsaGHoTQ4uMxU=
X-Gm-Gg: ASbGncua16Xl+Zj2nKCvz1Y0aRxbA1cqN9TdqU1xw3iOA57YNUL1kWj1NG+yHMUxSib
	z7LkuQKY3SDua9eimIKYC27bsUBA/YrUmQ6nRiWuNQX6jI+paLvHXMZPhb9jY/HR+ZkfXY3s2zx
	xGktDaR1QDIC06JOHHkf8WO9/Z/57V8prhcB9VTIGjIyvbaTf1K2gPnZpeUF2+r0vaPSxvvqgVe
	21W8//hZ4nxwM/iDvPTd57TxtPnimbYBfpzuqTIA+VvNdsOQ/ETlZZFLzSHLkTnWoKeclt1Zmn5
	ggb47I7BtJY+UW5yC3inxs+vIJzuJAXYiDd+JMsJXi3/S9eEsXL23w==
X-Google-Smtp-Source: AGHT+IFpY9obGLrPSf90qFUUIy/i88BUoaxsGk56sC6A1IFiBRGRyXqtZEhSta9iE3ZF6j26evkz0g==
X-Received: by 2002:a17:903:3c6c:b0:220:fe36:650c with SMTP id d9443c01a7336-22a89bac53emr69618525ad.23.1743797696161;
        Fri, 04 Apr 2025 13:14:56 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm36705135ad.190.2025.04.04.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:14:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-embedded@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [ANNOUNCE] Embedded Recipes conference: May 14-16, Nice, France
Date: Fri, 04 Apr 2025 13:14:55 -0700
Message-ID: <7hbjtblm4g.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

Join us May 14-16 in Nice, France for a small conference focused on
embedded Linux (and more!): 

  https://embedded-recipes.org/2025/

Embedded Recipes (ER) is a small, open source conference (~150 people),
with 2 days of technical talks[1] in a single track, followed by an
optional day of technical workshops/hacking days etc.[2]

Also, that same week other events such as the media summit[3] and the
GStreamer hackfset[4] will also be held nearby in Nice.

So if you're in Europe (or want to be) in May, join other embedded
developers in the sun of the French Riviera for a great technical
conference.

See you in Nice!

Kevin

[1] https://embedded-recipes.org/2025/speakers/
[2] https://embedded-recipes.org/2025/workshops/
[3] https://lore.kernel.org/linux-media/18ac3f06-58c2-4121-86a5-f8a2b5d1e47c@xs4all.nl/T/#m0ec5a88d4b24dc3bd3db6e0c6309031de1afc216
[4] https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366/
