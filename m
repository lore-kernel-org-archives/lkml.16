Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632C2949F3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810040; cv=none; b=YF/NhB89BmPGq4rs5RJ62eKWvNrMadu641AHyROXtjMhLcMI0/6lkIEiMue+N3ePP4ScR7eFvgeAvIFqLq1cV1KJNu7b8y70MWi5DYfrf/VIB48aOska5JztGewn66RUtXkuWFLv4nE9XL9LVEo4db/kFqk+4vnSCfJFD2FRPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810040; c=relaxed/simple;
	bh=wTDvkTqqquDXKbIGU2O17oiLClKHNDwoOkXGQVDycvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVRgWWSfBfKePxmK28gHB2d9MvI9E6PDV+Ko8Ol2DJC7kt35Ds+P9Y9jrqV7acFyNPOc9YMStfHuSMtvra+E78D7FGN4wDkBR5qHM2MnX3DMIwy1/uQPpXqZQj13zXAv3ZE0vB8zpJr3Ior2RnYrkQKhAoHBeTczcXdTWwHf5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FlyieHba; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FlyieHba"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb229f6bbaso36032866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749810036; x=1750414836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2H8yA5klxG4PLqd7e+FG1lHucZWSI3//UG2RyPUekJk=;
        b=FlyieHbaZuiN/1P/ut6o+/fbCC7CZ2d/KCVXhOChO3S2MvM8SL/iAb+Y4JAa+XGsYu
         OWYjuHALRQDoYowUyTBryG9fJipfb+3UvOjMsfa1izCp2oC874qifcoCGgC0YKur6Su4
         BNCfGTz/IJkT1jaNMD+/zea3Fl05Lfa4bejWlDaj/u31YWPdN3ixqEGM6H8WLeC9T15v
         w3bVpgun4NsBEpo2iEG/zx13GmNXTU/NnxUGd4rEpBr+Fonm/Yw9qAoukYvkPZOYiVcq
         Tan2xmQdeXcjT2WBIA2MDxCtUWCovOXeiXCW0u03Fr18lLz5j+HYMJ+52tii11R7akQ2
         vJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810036; x=1750414836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2H8yA5klxG4PLqd7e+FG1lHucZWSI3//UG2RyPUekJk=;
        b=FBxFTYWBon4hS+HRcGDO7cPxWjvHjLKIKhmJTRGl/O6TrG6tNKsVGVyWXiauqIvA/Q
         PvJQyIsRiNXGTcF0Mk+c/ietO8cLiT/SVKdOPzyGRIDbeKvFrIxTMEk9uYcVEYbFAUZ7
         0yA9gEQAKa63d665Qoq2APt8KpqvUEYOVmhNpo3NDdl99ZoZu08rY/si6B/1tO7Fmo3N
         tYQCpBt2ehDOGGii7xuhrdIsiyYIh8osYibdsO6brA2QZ4aHCkczTaaiTn17k/lru4A5
         cIHoTRZbqvwBI4nD2VyWow+IHv+a9vSKTsI6cPg4D2H2asOGn4QfQd0GhMVZJuYBg6G9
         lQRg==
X-Forwarded-Encrypted: i=1; AJvYcCWt1oKaASwSb7JiLnoHN2zZn0h0vt365BrW3HCDi9mgrENbCIIqBjJsX8iEc2tWhgdAOOTdlShf/cO8rWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOefkVvVWTPYqLwGzC09kQBsk3hiW4h1TvutiX/D8gkOZNXNIA
	/0Im2ezFxH6/L6iIOCFIvpQ9l/zuursMWKKRIt4mHZYNG97rdmrQzbAI9X9k25ZDdjQ=
X-Gm-Gg: ASbGncsHTUO6PCK4ZGMkAFCq7ODoFBWdqaadNVosX/Y5UvJWplwgK162eTLMxqK2+XI
	xCtXFq4Xn8zqUbvcNfP3ziMZw7+8EdqmtPCCLZ+Nqipnb/6VhmGmpveEgXLnIl1Myxa0YOUJQGi
	YO/9YsWZ9/+mhwFBoR4r1GxFnK+pCp1xIf4HPp/1L2I7JchVeb1rKsPPeEV2mKvYMqhANGJPHW3
	g6ImiBeGGrkutPzGeOAIpH/Ixdxpy6PKutL8NFhUsHkYMILn7FKmCraLH4Aig04M6WoiF8rHlvA
	ic+F0xkAz9Y8G4qboPbjMwCvWF8N76pbOVwW9+NaycV0sEDXlasg61LAYBXOMVW5xuwod6f+YBZ
	rf3clxlL18xIAe3CLVCpBonjAOQsTIfTh1X8HMQLX+Rs+59zgu8Jc
X-Google-Smtp-Source: AGHT+IFtiBQ/X6ly+rGpLgdRP25eckbTqMqUzpUwaD9hI53mS3aM58ZgMPHaJfNcKCk2EZT+YK3ghw==
X-Received: by 2002:a17:906:478f:b0:ad8:87d1:fec4 with SMTP id a640c23a62f3a-adec56870a6mr80663466b.7.1749810035936;
        Fri, 13 Jun 2025 03:20:35 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec892cd85sm103095866b.139.2025.06.13.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:20:35 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org (open list:NETWORKING [TCP])
Cc: David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH net 0/2] tcp_metrics: fix hanlding of route options
Date: Fri, 13 Jun 2025 12:20:10 +0200
Message-ID: <20250613102012.724405-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I ran into a couple of issues while trying to tweak TCP congestion
avoidance to analyze a potential performance regression. It turns out
that overriding the parameters with ip-route(8) does not work as
expected and appears to be buggy.

Petr Tesarik (2):
  tcp_metrics: set maximum cwnd from the dst entry
  tcp_metrics: use ssthresh value from dst if there is no metrics

 net/ipv4/tcp_metrics.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.49.0

