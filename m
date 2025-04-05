Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEE31A0BF3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.227.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877122; cv=none; b=idAGJw6klU0NdO//nNsLHHq0DNyo2/Yz/XWHw8NkSYSmF4R1pCCG6SdxbskCIx2dRFYI3pGbSVuzFOGmizIR8Tfa37/NMzwYoMMV/PHC7cqs5jn3ohKtRVfIdxFO8jBjaBVeX0FzcLVluWZvGV73RQ6JD2EZrrglFqYoZt9g+V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877122; c=relaxed/simple;
	bh=lkiecLNlz9E6VdFDtlI6eb2HfGn599bFHEhsIfacorg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f3+ooASMTbjF0sq1ZdxfvONWi/MM892fyWQggAz8dLLojRKwz2ROZMA27EE0LETobCGBRQW5ECTlGFPSp37n1RatK04+uvmCHFlcaNX80rIo+7wrcDuvjPaz4F95yVewNjGSQkvjCV2qqKFqyIoIJCJQ2HA8SVyFm4L19GM8fk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atlas.cz; spf=pass smtp.mailfrom=atlas.cz; dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b=XBf6MeJk; dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b=XBf6MeJk; arc=none smtp.client-ip=46.255.227.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atlas.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atlas.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b="XBf6MeJk";
	dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b="XBf6MeJk"
Received: from gmmr-1.centrum.cz (envoy-stl.cent [10.32.56.18])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id B21922018A83
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1743877016; bh=Nz+rgJalcyd1QLCEW4Tgk7u9sM/NVQLSYYitljvPygg=;
	h=From:To:Cc:Subject:Date:From;
	b=XBf6MeJk4T84W6cODM1ggUP5xlK/GoWvCAnAlKOIWgdaKQ6HbfjLVCefjMadjpYBX
	 UhZmWwZekpY+7tpEFmIj5Fkgcm1BOvl3p4+HnEa1OfC57Whxv6qKeQc1ahivUzPXDv
	 7vWOBz1rPVX6M6nnYOFm517bw/2b62+mP9+p01gw=
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id AF4C2186
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1743877016; bh=Nz+rgJalcyd1QLCEW4Tgk7u9sM/NVQLSYYitljvPygg=;
	h=From:To:Cc:Subject:Date:From;
	b=XBf6MeJk4T84W6cODM1ggUP5xlK/GoWvCAnAlKOIWgdaKQ6HbfjLVCefjMadjpYBX
	 UhZmWwZekpY+7tpEFmIj5Fkgcm1BOvl3p4+HnEa1OfC57Whxv6qKeQc1ahivUzPXDv
	 7vWOBz1rPVX6M6nnYOFm517bw/2b62+mP9+p01gw=
Received: from antispam21.centrum.cz (antispam21.cent [10.30.208.21])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id AE4A5EB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:16:56 +0200 (CEST)
X-CSE-ConnectionGUID: V11uSdsgS5KOg3LCn3KZNA==
X-CSE-MsgGUID: L1m0cJdhSKykgtDOQdW8Kg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2FdAAARc/Fn/03h/y5aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQAmBSoM0DYFkhFWRcpIsgSCMSA8BAQEBAQEBAQEJOQsEAQEDB?=
 =?us-ascii?q?DcBBoQ4CossJzgTAQIEAQEBAQMCAwEBAQEBAQEBAQ0BAQYBAQEBAQEGBgECg?=
 =?us-ascii?q?R2FNUYNgluBLIEmAQEBAQEBAQEBAQEBHQINgScPAUYoDQImAnGDAgGCLwE0F?=
 =?us-ascii?q?AatXIEyGgJlg2xB2EMCgSNkgSMGgRouAYhPAYR8bwEbhR6CDYQOb4EFAYFbB?=
 =?us-ascii?q?IE1AXWDDoJpBIItRUAWlmWKIEiBBRwDWSwBVRMNCgsHBYFsAzUMCy4Vdzgdg?=
 =?us-ascii?q?XyDeIU6ghGCBIInhnKEWi1Pg3MdQAMLGA1IESw3FBsGPQFuB5ZqhBcBWAEHL?=
 =?us-ascii?q?SoCIC0CLApIx0aEJYRNh0uVMBozhAONCYZGHgORP4ElmH6MDIF5lV1phGiBf?=
 =?us-ascii?q?lGBLjMiMIMiEz8ZjkeIdsMqdgIBOQIHAQoBAQMJgjuNLQEzgUsBAQ?=
IronPort-PHdr: A9a23:bMDgVBdaJC1J3I1QQur8wbgtlGM+ENnLVj580XLHo4xHfqnrxZn+J
 kuXvawr0ASTG92DoKsV1rKN+4nbGkU+or+5+EgYd5JNUxJXwe43pCcHROOjNwjQAcWuURYHG
 t9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oI
 xi7oxvdutMKjYd+Jao91x/Er3tUd+lY2GhlOU+dkxHg68i/+5Ju7z5esO87+c5aVqX6caU4T
 bhGAzkjLms4+s7luwTdQAWW/ncSXX0YnRVRDwXb4x/0Q4/9vSTmuOVz3imaJtD2QqsvWTu+9
 adrSQTnhzkBOjUk7WzYkM1wjKZcoBK8uxxyxpPfbY+JOPZieK7WYNUXTndDUMlMTSxMGoOyY
 ZURAuQcM+hWrI7zqFQSohWxHgSsGODixyVUinLswaE30eIsGhzG0gw6GNIOtWzZos/rO6cOS
 +C+0abHwi/Fb/ZI2jf29Y/FfQo7ofGPR71wdNDeyVM0GgzfklWQrZbqPyiP2usRsmmW9uxtX
 v+ghGA7sQ9+uCSvxtsyhYnTgIIY0k7I+yV3zog6ONG0VFN2bN25HZVetCyWK4t4T8E8Tmxsu
 Cg317IItJG4cSUJ1Jkr2hrSZuCbfoWG/h7tW/ucLDZ+iXl4dry/gBOy/lKhyu36TsS000hFr
 jBDktbSsnABzRvT6tKISvZ740yv2i6P2hjc5+xFO0w4i6rWJp47zrIuiJYesV7PEy30lUnuk
 aObdEYp9vK25+nnYrjqvIKQOo53hw3kMakjm8qyCvkiPAcURWiU4+G82aXm/U3+XbpFkOU7k
 rLcsJDGPcQbobO5AxNN3oYj9Rm/CzCm3cwXnXkCNV5FYxeHj5TxO13TPPz0F+uwjEqqkDd33
 fDGI7jhDo/RIXnCiLvhfLB95FBAyAcrwt1S5ohYBq8BLf/zQEP9qsLUAx8jPwG2wevrENB92
 ZkfWWKLDK+ZKqTSsVqQ6+01OemMZ5UauDPnJPg//PPhl2M5mVsHcqmyx5cYdHG5Eux8I0qFe
 XrsnssBEWASswUkVuzqi0eNUTtJaHaoRK8z/C07CIa8AofYXIyinL2A0D+hHpJKfmBGFkyME
 XDweoSLWPoBaTmfIsx/nTweU7iuVYsh2QuptA/gxLprNvDU9TEAtZL/yNh14PXelQ099TxwA
 MWQyGWNT2BynmMVWz82xqd/oUp8ylaMy6R3nuJXGcRJ5/xVSgc6KYLcz+tiBtH9RA3BeM6FR
 0u4TdW4Hz4xSsk8w9sPY0ZmB9WilQrP3iW0DL8Tj7yLHps08qDC0HftO8Zx0XHG1LMuj1U+W
 MtAKXWmhrJj9wjUH4PJl0SZl6C3daUTxSLN93mMzXCIvE5GVA59SrvFXX8BaUvMt9j55V3NT
 6WoCbs5NgtN08mCKrFFatHxi1VJX+/sOM7CbGKph2ewGRGIy6uMYYbyZmod3yTdCE0cng4L8
 niJOxYwCDu9rmzYFDBhCFfvbFn28eZisH61VlY6wRmFYR4p673g/h8TmOzZSP4J2L8AkDkup
 i8yH1un2d/STd2aqFlPZqJZNOsw/E0P62vfFA81apW6LKlnj0Q2ehhztlio3AchWdYIqtQjs
 H5/lFk6Eqmfyl4UL1ul
IronPort-Data: A9a23:9kCrFa8/U5f8pSPwhWq7DrUDnX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DccXjjQPfaMa2SnKYoiO4Syp04Cu8LVnINrTAc++y5EQiMRo6IpJzg4wmQcnc+2BpeeJK6yx
 5xGMrEsFOhtEzmB4E7rauW8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2LBVOCvT/
 4qvyyHjEAX9gWMsbjpJs/jrRC5H5ZwehhtJ4zTSWtgU5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxH4
 I4U6cHvE1dB0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQmcWkQVRyYiNnr45W0Ec1HgJ8AHu/CadZ3VnFIlVk1DN4pRNXYRrnSvIce1zo2mtpTGLDVd
 aL1axIzMlKaPkAJYA1KTs1h9AurriCXnzlwoUiWrK8++UDa0Ah4y/7mIrI5f/TRHJ0IzhjE/
 T+uE2LRJkgfbNe9xTq+0WOvifPjuhr3Z9IxG+jtnhJtqBjJroAJMzUfT1iypPCjokeiX9tEb
 UcGkgI+/fYa90GxSNT5GRqirxasohEYS/JUEusn9BuKzKvEpQqUbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTezPzUFaGwPfykJSSMb7NT55oI+lBTCSpBkCqHdszHuMW2uh
 WrX8W5k3ehV0pFjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:9KNAzKPRZ/KWm8BcTtCjsMiBIKoaSvp037Dk7SxMoHtuA6mlfq
 GV7ZYmPHDP5gr5NEtLpTniAtjifZq/z/9ICOAqVN/IYOCMggSVxe9ZgLcKuweBJxHD
X-Talos-CUID: 9a23:Y0kcTG4Rt0n2ry+V1NssyhdNB/spaXLmkVT3LBScImAya4+zYArF
X-Talos-MUID: 9a23:QITpFQbMzA9sceBTk2bp3DpAOMdTwLWtB1whtqwKhJmnOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.15,191,1739833200"; 
   d="scan'208";a="310586435"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
  by antispam21.centrum.cz with ESMTP; 05 Apr 2025 20:16:56 +0200
Received: from localhost.localdomain (nat-86.starnet.cz [178.255.168.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id 322A880911A1;
	Sat,  5 Apr 2025 20:16:56 +0200 (CEST)
From: =?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
Subject: [PATCH 0/1] x86/topology: Fix regression limiting Xen PV DomU CPUs to 1
Date: Sat,  5 Apr 2025 20:16:49 +0200
Message-ID: <20250405181650.22827-1-arkamar@atlas.cz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I have discovered a regression in recent kernels that causes Xen PV DomU
guests to be limited to a single vCPU, despite multiple vCPUs being
configured. This issue does no occur in version 6.6.

After bisecting, I identified the regression was introduce in kernel 6.9
in a commit that limits the number of possible CPUs to 1 when APIC is
disabled [1]. However, Xen PV guests always disable APIC, leading to
incorrect CPU limitation.

Following patch resolves this issue by skipping apic_is_disabled check
for Xen PV guests.

I believe it makes sense to backport this fix to stable versions, so I'm
Ccing stable@vger.kernel.org (as per [2]). Note that there is a minor
conflict in both applicable versions (6.12 and 6.13). Please, let me
know if a different approach would be preferred.

[1] https://lore.kernel.org/r/20240213210252.290098853@linutronix.de
[2] https://docs.kernel.org/process/stable-kernel-rules.html#option-1

Thanks,
Petr

Petr Vaněk (1):
  x86/cpu/topology: Don't limit CPUs to 1 for Xen PV guests due to
    disabled APIC

 arch/x86/kernel/cpu/topology.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.48.1

