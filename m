Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7C7E1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694483; cv=none; b=d7xtYJUruz25tuu4rFv4KhIMipjxpNRfKHCeOTm+R1/Tk67oIcUYlrCYITuz8pLGLf49AdkTnKhCzntase03/ap/3noU7c3Io8JSAsa960VNeQQ+RsZLvgXUmG+rd+UPkBXHdz03pTzSW/QWkZbltvWWPNQ+sObL8ICDEibzZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694483; c=relaxed/simple;
	bh=W2njX0aNcEZksb+ZdOEylLnZ6LAQ8oqd/7eAfvsvd4A=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OsFXGrYtgFruTnLmYzUbEevmjLxdUDiNRlvHED6qWWfNAkl0t2T0HWr09U72fzVNM0tICxVRnNjSoN29g0wziEekGEiVSkzLWE2T7bfvi3kPtdJEcEAi3UU926kCh5RC2O3xeQ3KR6imxt6epOOnVQBYopZ8ioIgXLJ6OU6j39E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=QZHrLMtX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="QZHrLMtX"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo8313322a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750694479; x=1751299279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GV9eywOsXK84WOKUgMvagNTBliIluKm+MCneZcnY37Y=;
        b=QZHrLMtXg4ohYmdSTDD1Np4AKe4rNiGOBD/zVy2sFwi4GJsSsusAh5tnvWKF+2eVva
         yq3rRjJ9NpVpDk2p9qlnCCsHX4IH0lWOrtzrBTHw28yuLvJgPIAhEw2epvXwI974LSAZ
         7PqDVHyirVxVN+rj8rYpsk8MFLeOwPhziQE0oLvWlZlFDEHWuFaKeHM5Av6i2hjbs9qC
         PYMpYRF5bMWVsWByK6AIeptH7VXDG0RF4ZUXxUdVgqGViud92siPvgsI8Oqa751yyzHr
         Y83ff7JX87DMlTSAjZFbN0+qohesOhjbXi7SXinXNLWd8e26lkgQXNCM6r3f8Ai+l2Zt
         r9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694479; x=1751299279;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GV9eywOsXK84WOKUgMvagNTBliIluKm+MCneZcnY37Y=;
        b=XQNb+eAehTZPI2v0rC5AWmOmQnoMufdpFZU7GCT/AchxPykncqAZTlKxC+c8LoJocb
         E10prW/ajxaQTFShoYDjOgH0UCN4BDAGIfiaTcTpjv0ySXzuUlwFaEpmPqvG+9wWQRn8
         RjdwZjP0jNE2jHt76+8CnekZ0yCkPuoNxrNX9NpRynsKpOvPYvhUCsm69BBYZvHiqG0A
         jSPoEYq3l3n3m8iro3HrohxVz2/wo3HUfyrDcBB/qa2spOdWootWahf7NJL03eI8txp2
         lJEEbct4Stw2Es3hxHAnfNgZnoKS0TBrbdVTSaibNl+/skukwyG/Cb4NS9FcMmemEGM3
         SrZw==
X-Forwarded-Encrypted: i=1; AJvYcCX4qo4PoR2T6fj3l2qtPThxfVd2xcKy2A41a5aNc9jqMLUclPcuU5iUCDB6xlghNETQysQ7UqcPNMOG6Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWguVSwn/WYM5KVwshen3KpxB9Jn3+xOPokhBDUzzgir/uS31h
	0arXBWPK+y5yVl2KOistd+OZjPIG49jKilJdAMLXO93R7J/DZCz4RB/c4NvtG74VWQ==
X-Gm-Gg: ASbGncuBS5gTLoCoD5DUj+n2CE/2ifbp5b/HQwykDcYmwIrchEUBtbQUqX9AtTgH+97
	sJ+6ZnfoZl32WghP44g4W2qEUo4YpktmxkaOBxt+3IGSkHVd5mPBg2zM4RGj0F9rFFpdbZHu2MK
	m2+GqL0TZLXnSmmJ7uFrqXKcEB8KlPJU3AGP1/OFQBfCSncVN7DSJ/oYZu9IX+ZnNP7iElbT3+G
	ptGRLbe90Tw+hB9sjp6ZVKqUq38z88RoFbF5SI7B7oDc3lUtd0Hw3fJkPytmvaEqJ+kYdWKFibB
	MjXqP0bMgxz+2muEFNmMoo1CLvCQ5rTyWWtzFMyX+0scFI2fMmHyBdRx6H16hB80
X-Google-Smtp-Source: AGHT+IFeFRf7fXY8ItbHGsczF5S/sRpaMQZSC5ENBtBuUJ/TvWbUeEnuAnFx8nQF8fRGIRrYzCtMHw==
X-Received: by 2002:a05:6402:3493:b0:607:e3ec:f8ea with SMTP id 4fb4d7f45d1cf-60a1cd1a66cmr11552849a12.6.1750694478557;
        Mon, 23 Jun 2025 09:01:18 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a185449d5sm6231911a12.28.2025.06.23.09.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:01:18 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <b7856437-2c74-4e01-affa-3bbc57ce6c51@jacekk.info>
Date: Mon, 23 Jun 2025 18:01:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] e1000e: ignore factory-default checksum value on TGP
 platform
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <fe064a2c-31d6-4671-ba30-198d121782d0@jacekk.info>
Content-Language: en-US
In-Reply-To: <fe064a2c-31d6-4671-ba30-198d121782d0@jacekk.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As described by Vitaly Lifshits:

> Starting from Tiger Lake, LAN NVM is locked for writes by SW, so the
> driver cannot perform checksum validation and correction. This means
> that all NVM images must leave the factory with correct checksum and
> checksum valid bit set.

Unfortunately some systems have left the factory with an empty checksum.
NVM is not modifiable on this platform, hence ignore checksum 0xFFFF on
Tiger Lake systems to work around this.

Signed-off-by: Jacek Kowalski <Jacek@jacekk.info>
Fixes: 4051f68318ca9 ("e1000e: Do not take care about recovery NVM checksum")
Cc: stable@vger.kernel.org
---
v2: new check to fix yet another checksum issue
 drivers/net/ethernet/intel/e1000e/defines.h | 1 +
 drivers/net/ethernet/intel/e1000e/nvm.c     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000e/defines.h b/drivers/net/ethernet/intel/e1000e/defines.h
index 8294a7c4f122..01696eb8dace 100644
--- a/drivers/net/ethernet/intel/e1000e/defines.h
+++ b/drivers/net/ethernet/intel/e1000e/defines.h
@@ -637,6 +637,7 @@
 
 /* For checksumming, the sum of all words in the NVM should equal 0xBABA. */
 #define NVM_SUM                    0xBABA
+#define NVM_SUM_FACTORY_DEFAULT    0xFFFF
 
 /* PBA (printed board assembly) number words */
 #define NVM_PBA_OFFSET_0           8
diff --git a/drivers/net/ethernet/intel/e1000e/nvm.c b/drivers/net/ethernet/intel/e1000e/nvm.c
index e609f4df86f4..37cbf9236d84 100644
--- a/drivers/net/ethernet/intel/e1000e/nvm.c
+++ b/drivers/net/ethernet/intel/e1000e/nvm.c
@@ -558,6 +558,11 @@ s32 e1000e_validate_nvm_checksum_generic(struct e1000_hw *hw)
 		checksum += nvm_data;
 	}
 
+	if (hw->mac.type == e1000_pch_tgp && checksum == (u16)NVM_SUM_FACTORY_DEFAULT) {
+		e_dbg("Factory-default NVM Checksum on TGP platform - ignoring\n");
+		return 0;
+	}
+
 	if (checksum != (u16)NVM_SUM) {
 		e_dbg("NVM Checksum Invalid\n");
 		return -E1000_ERR_NVM;
-- 
2.47.2

