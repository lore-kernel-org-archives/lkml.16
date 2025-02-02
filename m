Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F22AE93
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738527329; cv=none; b=KwwEtI6qSkIsfD7J3FVKRIVdNsYO+bHdzUpJgCnwxkNpLLPaxVc4tggF2qXlwjk+3/73URlRzli0Kvtr/XY/yyESkmBJvpT3eFLsdhKKn0RHPQi6eHvfOaDWFILsG5JETsGy2yVExc0U2WFBB0tedRTgCqJBGUYxuiLxChp0wjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738527329; c=relaxed/simple;
	bh=atAmdxLrk4al6aiauqsCxWRu4+yuBggHzKn+HIqd9X4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=R0Qlid6lxgeTlz0jE1vzo83iIc91PfurrIssO3IrNkuc419pmpVaN6oHgFeDxzlxcgg8ZBQvniVTGBomiO/X4/MpDZGtHaJH8YGPbSRNcEM94urrgZffVZWxXUodpf3bTVvsC5SCvDb45UAHt1B1m6JFzokXPmtanA85OHh2RJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHtUc+Jp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHtUc+Jp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so702095466b.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738527326; x=1739132126; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=atAmdxLrk4al6aiauqsCxWRu4+yuBggHzKn+HIqd9X4=;
        b=CHtUc+Jp3Da8hLyDsRoSddtsRzrTwBoVH1cU23V0MuA7LlxvgmkTouYY9hKVZuoI6o
         YvksttIwnIZIkjIaXasVYUBl4LkvSI8btkUCEbZxUaTCLTz0LPksXWP5tpeKZmfzeNcX
         GKRMztA68eEtg8z9IWbGutynagAiPS/3c6EoAMJwBMggMwBMiap70+JVdcq43yeA0q8N
         pIALYe+K1lT57R1XDEybFVY05VnfMfscfMll/0UZloAI5ijEVWPdXu/6bV68vF3EhAbA
         OjdzQxvTez6p2i48IdHCSeUL72Nmh/Rtfa9lsoMCdJrhPvZESRrZWayigzud5rlzTcK2
         f+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738527326; x=1739132126;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atAmdxLrk4al6aiauqsCxWRu4+yuBggHzKn+HIqd9X4=;
        b=bDHJHSoxbiJe/ElAEKRpIlgpetycTt8CFhYDmLUOOCpVhtod+f1kYLI9BgvVRDm/26
         8v8iv485JYBycRr808Q0wpnfQC7ktpEg5vu0l3751/wCBIhIfB8PwAakP/6cXmEXrQZT
         cuF5xgHPRgn2RYsg1rmJNQLMfNZAzYnKDExxg7k9Nc+c3pdY4+JCPlL9AGHyVciIm36Q
         cpY7isN5nKecmEWMBaAQmTBV9ZnZ0O5JXZVXWC7RDlGWWSX35kURZs9zL+QvMuYlkzHy
         2NbvKlJr0qEppxg9Yk8beXPUQ2nM9uitEz0dHlwYG2n8ScH1Teo1JZwLU6KkUDt8IaoB
         74Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUxpGLki1vLiS62QL6lGsQs/ZW6HfOIWDU5WvRNq9dO+8pEW58UVMmHsywOEeTX6EtSFonRie8j9rI/NC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zuxdS7vuGzknmrOiqb+PclyN5e3VRtjUDqSj1Vkk0QsDKzvi
	bR5vKu7y86V7WCl469LKAVRfJLLwqLoRaJ9rjQKduf/EIrDLEYU83HLn8mrCu23MtlfzCSKTa1o
	RlVgtnHZfwxMzfJAbojmD8FWidVM=
X-Gm-Gg: ASbGnctqHFo+wdKQiHmqn3OTs2jmxF0lrzltCKyrK2uap5nndBUqQAJTpToFvfg1Xvm
	fGcHbYtY/pSemRiWGlQTywPFGjBfiCEXZ7XI247wsXo/+01TJtyN2i6gsW87ECiQheHYPBXY=
X-Google-Smtp-Source: AGHT+IH+a4W3Slx1nCQRwarJ8anf/llnBH/ZD6Z/djroBkAotBakLZQcMBXZAkQPVOFYf7OG4ywRycqAWo+iFSo3n0o=
X-Received: by 2002:a17:907:9452:b0:ab6:f99f:45e0 with SMTP id
 a640c23a62f3a-ab6f99f5410mr1456779366b.37.1738527326180; Sun, 02 Feb 2025
 12:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 3 Feb 2025 06:15:15 +1000
X-Gm-Features: AWEUYZnXJcy-i6ddbTZXPd1YVFUR8YJ_IoyZNoKtgyuZDoOQfWtBETPwg1zkLCw
Message-ID: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
Subject: question about firmware caching and relying on it (CONFIG_FW_CACHE)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, 
	russ.weight@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm asking to see if there is any chance of consensus on having a
driver rely on (select) FW_CACHE. Nobody currently does.

Currently FW_CACHE is an optional feature (that distros may or may not
configure off), where we will cache loaded firmwares to avoid problems
over suspend/resume (and speed up resume).

I've just discovered a problem in nouveau's suspend code when the
FW_CACHE is turned off, it tries to load a few in it's suspend path
for certain scenarios. Enabling FW_CACHE fixes this, but I'm unsure if
that is considered properly fixing it or should FW_CACHE just be
considered an optimisation.

Do I
a) select FW_CACHE in nouveau Kconfig
b) fix nouveau to avoid loading the fw at suspend time (effectively
caching it itself?)

Dave.
