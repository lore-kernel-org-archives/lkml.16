Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE820E6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206436; cv=none; b=gopB8wtQEC94mrFJBpX1AWgivRkozaN60hoaYUHv7+7a/BhlDxGHXR06Jk6g/zYHxPBbjswCdtXiAHtRi/upf2NaO9XkX2zzttLF/cb+F0WWrDdT7eJF4Sfm0jcoqtmes7N1NVSe4Nu1+PRCZsqmF5t53ywIDCL1R2y5kOArLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206436; c=relaxed/simple;
	bh=0a1DTC6uahwJCGg8+TCx/4i6vOJVdSP3T6MKAIya57o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esN7iISygWAO6APtSe6zbw3uv5TGa56FSzIyD5DkumD193HMGaoaoUzTi59NdYw7Vayw1OvTgyUPVG4Ob7Ms80VPu9r/B5A3ziF0mZans/UA4qIR6YOuggBOwNh3DNYUywULApLrlB9IhdtIrzaaQqIYxSvFFg7lohv82IA0uOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=PS/f4eRy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="PS/f4eRy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so3509701a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1743206434; x=1743811234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifLYiUPET7SDV/Gtqe1wiBHrTm8AmBIWj9O+ElgmM5I=;
        b=PS/f4eRy4Wm2vcwnrgCFD2Xw8py6IDKcQpIgeSWz2kJkFX5nub9h3DSuwOKq4ix5l/
         o8fphbabCae2jpx7EknpNIq6Om9vs28B1wenw3FiyUTutSmdJqWckxyo52CAX5r7R6dy
         PdYlNBZgPA86gjEYrG6R8qI0n2IRTV15GUsaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206434; x=1743811234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifLYiUPET7SDV/Gtqe1wiBHrTm8AmBIWj9O+ElgmM5I=;
        b=HPfiBVFPQltT7IiS16hfrqPC4kwoYrNLlN80fSF/tiMzaBByDXwmffcb3i10ptmv9f
         TVjXnhTGRgi9mm+QD7YQbZStGHsKpFW2Lny2yXT0a5bZ3Mmy1yMoB0M9V+6BJT+jsvi5
         35OA9MMTVSPnlT3SDMsN4MczfsdcbuydrG4Qqf3n6QQEBMVzQ8lRpDkdWRXXgb3mnNHE
         wlJeorrhR4rreZ9a25kueKPNNmJDPYWoKhzoi9bjreolIM+DQ1/MKQrX0aRQniU8Z8id
         Qehju8eHsMbtm5+Fag/cB2AucHrwSDgCxfvggBJ0r3hZbE5IMicR+VvESdS7zLGXQcxp
         /mjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ57VWNFRWqapgd4/IHWlxgbzAFdpsrqSsyJgg6EOZqX/Dm9fdGVq9Mm0pk2lHg+cJk7wJLAYaHqmn61c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9D2+6JoWl+9XJFyCBn9gZuOowNxlotijIFz/ov0mBaesfdLX
	HpG++5/gpv3pGUyD72x7gK57WlLaHUWQoBgYN+XXMQAJLiEmUf61G1T4TSM8GDU=
X-Gm-Gg: ASbGncsOFqc7nulWB008BHxhS1utvP8vwnMaJQJy5n68yBF1q8BnRHFirv7yQOTis8t
	hsabbnphjU7r/YWQSdKzXbNswa2kD3aQkq6XrOccV5/JFff7SpsDG0U/2QcJD/FzuBwvtFmno7r
	4f2HaN9Yd81q0UceoeAOINP75cYMyJZ5mbeci57MdpoUxRNTyOGR8WwTB7RVypSmNzwrvZjukm6
	bWIQG8onM5L3SCCvsrmK9wxpHuOmfAMPxB7+qq7nw3+mdjkGCz3pDwXMmvstF+j4UtJq/HWGxPi
	brN6IgN63FFuRjaZiYOKwtTflBCzAPFodiVk42jpmSrPLVocGvt5
X-Google-Smtp-Source: AGHT+IH0UyODGDUJJwEA59rR1uONHgeWOPfaxVsYR/noCUP0cQDlaEF4hkN0Caq16V/gbGo9G27hyw==
X-Received: by 2002:a17:90b:5446:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-30532147035mr1612441a91.22.1743206434054;
        Fri, 28 Mar 2025 17:00:34 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4ba4sm4857139a91.31.2025.03.28.17.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 17:00:33 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	Paolo Abeni <pabeni@redhat.com>
Subject: [RFC net 0/1] Fix netdevim to correctly mark NAPI IDs
Date: Sat, 29 Mar 2025 00:00:28 +0000
Message-ID: <20250329000030.39543-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Sending this as an RFC because I'm not sure if this is net or net-next
material?

If users are using netdevsim out in the wild to test userland apps, this
might be an net material, but LMK.

If this is net material: I can resend without the cover letter and when
net-next re-opens I'll update the busy_poller.c test to check the NAPI
ID isn't zero.

If this net-next material: I'll wait until it reopens and send this
patch + an update to busy_poller.c as described above.

Thanks,
Joe

Joe Damato (1):
  netdevsim: Mark NAPI ID on skb in nsim_rcv

 drivers/net/netdevsim/netdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: 2ea396448f26d0d7d66224cb56500a6789c7ed07
-- 
2.43.0

