Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE305289350
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424240; cv=none; b=bOkjfy8TW3ElLcG7YfqoRrr2UyYs9shFsX4lj8mbkc1Tj2sFReHEMyqMA0YfaehWiERaAF75qUbd/eE+eiGmt9yjMQtIbp3vNhsWzNFzEjzhjdn+0EysJMMHfTmB3O59v0YbsHfxhbykgmGI+UL2xp4/z705m3QRIwTo3xC8Tyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424240; c=relaxed/simple;
	bh=lTPPKqsjRUZhBLRfXVcXfzKpDXjJLav32kNwPoV+o3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9zZAk43JcbxU5iuN+vFanTaHfspU0Zwr270y8AaGyZlYmBhkpSpwaidTxMgdWIXlWquh3YnbpaHG9jKPF+XgMgwPpZiEs8rW+gVnjiZQgkFlAueSsBB1JX7lSWNCkYOScsuhzDJVR1hXtmu/1rAHMwsKKqK0j9Leiq5HBGydjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fv6+lj1u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fv6+lj1u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4533fbbd21bso656595e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750424236; x=1751029036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcQf6CBPY3ZD6ktFmPaCJ7ntO/vY14LwSb9xlORB7bI=;
        b=Fv6+lj1uLKWUKIqbDE2ahUKu1GR7eOpSCtb4UZi9ZhZN41HgIHxXkVC9Z+nyefvg9C
         3v8K70p3LSv9RgKCRltIiuCBMhSrh4jTyb04La5y5DaqEV4kHnck5S2vnXTllP5LR9HP
         WRfFHa5To5gs7cylnTvTbzCnXnzz9Ofkdoonmv/7k3oCEzrD2gwofT+vV2fcpPfoELqR
         vp4POE4jXpcxQE4rRQ4Tq6eWfDapm5iFIejO1gWrP2MZ1J8NNtRCCZ9GihkxawZFJfTh
         fPax852U/Wj+O9Fh7WXEEU77avkgmGUnrL97XEptL46siES1A8YdRN3NNd6sPOLsYFYg
         96sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424236; x=1751029036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcQf6CBPY3ZD6ktFmPaCJ7ntO/vY14LwSb9xlORB7bI=;
        b=Cm2e0FPANA+ElLkvyu2DrxwPLFhv3J+PMWpXZoVt6nRQ8yJJVtkFiwgdd2zKX6iwMF
         57QrjfBbP/NoRTzVrLZadT+OJU+ZOLMUpvFl1oCfegsLjwkO0dR0rDu5aEvVK1afHsdk
         BNuEbFNAKTRlvCb+0yBFT6oW72gGukcclmEoc2Ht94l5+d0TSbb9+yC6O+nfRkmxbaS1
         k/USVnCXr/td5hsymHWc0gFzURIuV23iT+HfBMCWmgr56HN/NfU2irFHHkQAaY/zaqok
         AZBXw+PjMiuJXfB6zy5nZl3o0HH0MDwM2UHsEgd0h4nhWpioJvpr1Z2efYRwpIg0P+os
         uf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUspa+hmcrQVoZZAC/67n/lfF4fHdf3r3TgRiuvI9spT/tDfF6p6Pvv4Ty2gS+1TC9S0XkzcOI+mLC38LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCpgWNyVuLDc0pmdcNdQxLi3TBlZbcqxLc3mM719S9PHm53A5
	TZW7WpuFPYYq/hpoB1nPDpcxewH7uZCLEkZ7C42/IVq5TzciHmxux0ESsLZC0TCsMb0=
X-Gm-Gg: ASbGncuGLDUKmfjbcoJ1f5MhM2ePzjojjME3bydEthhYuJoBTQDr3v7G0/b5A4p5ti7
	Rp1IWjTTNFNQszOjZ4ApBft183wh0o5krBZiHKKbv6R8KHx0LqWlVJ+DD3GF/pWro0Ob5D+qdcG
	CTnNJMM8Y14edTTTYwOH57mwvgzINxY3vavOCyDzJJ4E29dmWWYcJ0IpHKLGmMZGDR1UwoXh5bS
	3GISsIuZO5WqAVGReghCehmgWlt4HU5XtnbVpVEVcDMHjDdJaP8hiu7euOZkQZUbr9FuWiVKWz2
	Bk4koD4MATMwTqu+CUmpGJvUSKAsbL88sBWau+448QMLuhmw7ebaEtJPi6pv2SLcjGJu4170doZ
	9i42D+uDc9FFanfD8fu4exE7dILOsw/XXd9/QcEYeAWWOjenJu1oA
X-Google-Smtp-Source: AGHT+IEHbW1gi7tKLAH0rP+T2bleVijcw5AagqiUirX0zCprzVmiF7q9fNFxn6Dgee94AnNr3udkCA==
X-Received: by 2002:a05:600c:3143:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-453658bac2cmr11147335e9.3.1750424236123;
        Fri, 20 Jun 2025 05:57:16 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8c16sm58113845e9.19.2025.06.20.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:57:15 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org (open list:NETWORKING [TCP])
Cc: David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH net v2 0/2] tcp_metrics: fix hanlding of route options
Date: Fri, 20 Jun 2025 14:56:42 +0200
Message-ID: <20250620125644.1045603-1-ptesarik@suse.com>
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

Changes in v2:
- more background information in the cwnd commit message
- fix handling of initial TCP Slow Start if cwnd is clamped

Petr Tesarik (2):
  tcp_metrics: set congestion window clamp from the dst entry
  tcp_metrics: use ssthresh value from dst if there is no metrics

 net/ipv4/tcp_metrics.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.49.0

