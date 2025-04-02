Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27C288DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627838; cv=fail; b=eXvyHMfCIxsuDo5uHOiJ/geoNeZ11l413ReH5Z5/2D1QaeVVZxlx0cwMjGxfytZgZ3v9fWYhRy+vs6qsKFe5JWb75eVadoGhnhk0+aEaeApHEDKb6zVJkWPvP23mNkPcNWePcRflUrWWxqkE8ynYdRbcVeB+Uit/mhle4Jzvnlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627838; c=relaxed/simple;
	bh=lAOZpg38NWHNJSb/KFPQwhm3H3x9uoJMyETX291BRlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jNWjgcajhOM5aZ18J0zuiXfBLQS6YJVF2eauZZAjQLxDpeW6q3ggefZFv3A6JTMAnNmcGjYYkAYnOJOCCh6BHpOimQ8swrCE9KNqlFj+H67/VHLB31Nnx6DXoOgTAGx6jhFpvkJ2h4fReOuu1T0OBgPQnqU6B3x17SR1FbI8OKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=QVw6eUFm; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=FtHDENZw; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QVw6eUFm";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="FtHDENZw"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1743627836; x=1775163836;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lAOZpg38NWHNJSb/KFPQwhm3H3x9uoJMyETX291BRlQ=;
  b=QVw6eUFmZRXlp8JI+BFVQE2Mb8qlfQOW69QLH9zZPagdjT6LMfxmdkjX
   Z9FFHa5DHwijZdlH39frC3PefDdLh81Es7u80d/BKZKdwVSGWrVHueksD
   s8/DnwEpagHJntpwvgzAA/1blrKt1JlI33AulKtTTXV/ETpkx/ZiiI/zZ
   I/TjDR1VDey+1eu/K+dVK/wPWovEpnr/O6klA1IJXAF6ka23yRKERRukn
   /3cJwRnkYlAxWe1pFvTvkoeXrAAdoAXPueX9ecQAAfiDj2QDlgVxN+DhI
   QhRXq5aMZ8i6a9ZnoJq7egW9941b/eSTbdDCp0vB2vKrPgvNPh/V06pGb
   Q==;
X-CSE-ConnectionGUID: 0ZprWX1tQgqcVDVJGJ09kg==
X-CSE-MsgGUID: VVsh48COQ5efqXb5Ruu8wg==
X-IronPort-AV: E=Sophos;i="6.15,183,1739808000"; 
   d="scan'208";a="67679328"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
  by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2025 05:03:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUwGEePIoIBw/dwbht27BOHJ4v7fJKSX2mM6uveX3ESU2iO6PprM1Ft5pi/zuuFejtOWbJ8e8ND2foEfyQM+E8rL9e7dGWSbQZUPf23UZEHsSDRnZC3FQfp07vXPjqm0+gR3EuSDGfdSMmymXlb3GOSMBmTYisF9CSP+93pbCOQMfemJ+gvT8m3JrkcpOhdHRdO5G7xTxhaxJ4yH+HPcUoIgpOgCIfvPSWobSto1LEORPr0XgGTAbhr2c4V5//wzw/JGgHUyqo8JoUSB3RXAowXx88DZcqmDdJLMeUUCY6ehWaCrH9bCFBHhXyHzjBGqQsajZAhOnuOGc8OvQ4GisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um1fIq4CNkm6KRwCK5cx7GQNpgoTg7ZK1JiTFgVmFP0=;
 b=aKNU6u59PIEvzUUTAgqi2HTArpct/YZNBmNmCpLQcwXhDLI46MZ4a6stO4uh/O3U+aP4xcb4+PndneC1dxDikXfRF0D/cuKxMsJaUwMHzk7079BhHavFyPXjFpVyMb04e/OKlnn23LGQ7woreq1U9O07+0qoWUtG0Z92N5uLyWEI4RsKTODh2GWgJ241Q35WP3kgSbQ4mYnQEJ42Qz8V3B/hoVy1fcb5iT8m8Z7s0HPJ6MJ+YasAYDmrQ0t3LZo+Wy71AsbmFZIhP4RSfEGrRLshJJpaC1q+LK+TgOtrryWtTj4gX4MLVAlaU/U2KznQfwv15ejvggDDEfAIbfNtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um1fIq4CNkm6KRwCK5cx7GQNpgoTg7ZK1JiTFgVmFP0=;
 b=FtHDENZwv/gBTUZfcH2gFSDRWVTUoWqfVtX5p4Q5W+lUlIUN3TL1xOq1PsfXHRItoFL2NwAGoZMqp7F+TqgU1J8DhC/GS9okv25ZLUsn3SEev9yzI/zW4L+DCbTgJIJv9+ANtvqegkUXr50qeh8esMB0hUMsJpkxdVoUGwEOIBk=
Received: from BY5PR04MB6849.namprd04.prod.outlook.com (2603:10b6:a03:228::17)
 by MW4PR04MB7153.namprd04.prod.outlook.com (2603:10b6:303:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 21:03:44 +0000
Received: from BY5PR04MB6849.namprd04.prod.outlook.com
 ([fe80::b2a6:2bbf:ed0a:7320]) by BY5PR04MB6849.namprd04.prod.outlook.com
 ([fe80::b2a6:2bbf:ed0a:7320%6]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 21:03:43 +0000
From: Kamaljit Singh <Kamaljit.Singh1@wdc.com>
To: Niklas Cassel <cassel@kernel.org>
CC: Keith Busch <kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, hch
	<hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Damien Le Moal
	<dlemoal@kernel.org>
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
Thread-Topic: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
Thread-Index:
 AQHboCmElT3ixkj0uEiWsWJv1g7nM7ONW7aAgAEdaoCAAOqDj4AADYAwgACB+YCAAO7MXA==
Date: Wed, 2 Apr 2025 21:03:42 +0000
Message-ID:
 <BY5PR04MB6849D66446B2E05D92D80257BCAF2@BY5PR04MB6849.namprd04.prod.outlook.com>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
 <20250328213640.798910-2-kamaljit.singh1@wdc.com>
 <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com> <Z-ueG-wTibsSu5lK@ryzen>
 <BY5PR04MB68496CB7512F91FEA30DFF86BCAC2@BY5PR04MB6849.namprd04.prod.outlook.com>
 <MN2PR04MB68626A7C2D254018FB37851DBCAC2@MN2PR04MB6862.namprd04.prod.outlook.com>
 <Z-zbLx9h0IbOEmbO@ryzen>
In-Reply-To: <Z-zbLx9h0IbOEmbO@ryzen>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6849:EE_|MW4PR04MB7153:EE_
x-ms-office365-filtering-correlation-id: 46004227-6a3f-411b-be83-08dd7229d9d8
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GHD6yBhXlvzn4kIE6yoz4aoQ3h5GYoARLjHYaNQ8el0R22FMemkBhYcYk8?=
 =?iso-8859-1?Q?GeOkrdJ+Bs/bD8wf4C8r3DClVnx1OyviqLqLIws6zblx0fzSW4ujrwFV7L?=
 =?iso-8859-1?Q?dkyEz9UoVDGeLUnoJCgElgBH7kVFdHZ20CyngGK5iPfSzrhj9pLIUpVl3n?=
 =?iso-8859-1?Q?Q18fUOSXn+KkpZPSwu+S2L3Fbh2BVtnPnoYSL5Yx/zVJDkZPEtWIk2m4VF?=
 =?iso-8859-1?Q?++y/PQjNrA5OWgHndMUgJ9w2kvWiV3PKq68s4me/c4oChj/W44RqU5cGia?=
 =?iso-8859-1?Q?yPjoUdJFgK+mbprg9bzBI0Y5TV4kkKSm5JpqioQTqMXi+4vwG8dokuscSC?=
 =?iso-8859-1?Q?/OW/aMXZijFw3YG40IK1sf+cV/vISXnOzifiVGch07WjPqybta9cWTvH0K?=
 =?iso-8859-1?Q?3RsAZqeW05rjvH5/9Vmoyu71O2XVqv97GCOGQqUZkgijl985wbKzO21SYL?=
 =?iso-8859-1?Q?JvR5s0C742tS1MHb5iPnehQAYV1mZ3tYccyubz/TomI+iShcPqBPcXbiqN?=
 =?iso-8859-1?Q?YuEs5ej+sX0TEmQQ28DUN9otD4OGVrASPUh9sXg4DpqezRZhihqxiJDf9M?=
 =?iso-8859-1?Q?ptr7taqg4ao6fyfUzbpTavYVs3vH9aycwaOhcrcjz6U+RTAkSD+yQGxSW6?=
 =?iso-8859-1?Q?xFAEkyxn6O4d2mK+H4rl8kXTVOqdEo2e9XUJKUAvPSH4uHI/s8U3/2Z8BN?=
 =?iso-8859-1?Q?4VJlclnu5V9yrXCddE8DlOWB/sgs3wJDL59+3/IAz0oeK8DSPHTQTAlS3E?=
 =?iso-8859-1?Q?SXtiq8jn8ySlhVjDdEW3uRWZCZLkjlEpDTyJb6KR6mly+ofMYffpkseIfL?=
 =?iso-8859-1?Q?UK/5IGYbaxKXsVnJTCfkMzGtIZiVRNZsv8gnB+Hr1041hfBvJP9wL4UptZ?=
 =?iso-8859-1?Q?1X4bY1Q4Cr5j6fJoQiziDa7kTElDlUELNMlN5gn9jUOHQ0glX9VFjQGZeK?=
 =?iso-8859-1?Q?903jawZyehopKFKyJpUfstDaCUbWnJCtoRWeMJhWN/Zl1aZwM1qFDD/NkT?=
 =?iso-8859-1?Q?9H1oR0d980LJhBwp0et18eOM8oKEYqv2QYHJlmJohvIB2ymt2kP+EViaL8?=
 =?iso-8859-1?Q?9vxCoHt4CWuFZMB5TmCXetB6VSzGK0k4Hus9ky56igMo8eIZyGFZj3u9q1?=
 =?iso-8859-1?Q?hvR3wPmrgUHYeZG+m25x7TZtWRMYT0W2cucUX69q4b5qrpSSA4Tx0ORBwU?=
 =?iso-8859-1?Q?y/ZZabaML1zWW2CKoeUqhWzLvcLVvu1YLcb3+y1NqlAHDrKPMrYZx5be4t?=
 =?iso-8859-1?Q?igGMqrad20H/gOOKzq4OUioHFTcKEzx9gDz1cug7NqqhdtAs4ZQF89ioK5?=
 =?iso-8859-1?Q?5UOG4gsmWY8qd4vyXC1n2Wnn43bav96yQYL8FTiezaenoR3mmxwrrwzGYk?=
 =?iso-8859-1?Q?YtTkBeqO3QNQiqxKAXNCz05rTdbLsMzPnXQTVaPKqH1r96fDhSeb7xiGBF?=
 =?iso-8859-1?Q?cR/Qbvs3ppEqohaIxgnjJHYY3c7m50xAjsJ81z3sBXvD+VgoCOjEKxFKRG?=
 =?iso-8859-1?Q?kCINCCZOp25NeanzOKfasYuJZEsaaNdSSFgjC4RqzpnA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6849.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vhF/t/GNSIfuoDhQPB+gVzPZL9Yxy1yxR6s8mPjvhiai2eryQi+CSoDx+E?=
 =?iso-8859-1?Q?wfRlin1M50zCW31R4emwa1BPm2JFCXC1fR5AZNAkYAUmz6qak4iAKslIcq?=
 =?iso-8859-1?Q?KvIfDZyAHa2zClYKfstXuaSloa+OxrpNsAs81/TMYbB/6gXP/MFoxUh04Y?=
 =?iso-8859-1?Q?+AS0n1BxNfcf7BUEwNQuMbE2LPa/XMIqXmlZJIwHLCVLp7/xL6H7XZhPmC?=
 =?iso-8859-1?Q?THHo1dj3wxtYInbSh3vzghwMfVH2YlnEKCh83unD41jzfIwgw9YrcBUppo?=
 =?iso-8859-1?Q?NsB8J9eaW5TraJYeshfwtW6NMJPFnbZXMqDG7C/HPXZDRWk3YhQ2wnqc4X?=
 =?iso-8859-1?Q?HGlrkPP7xlZvG66Q6WyhNSqcjZlKhN7xCsUnIln40ykvxdM0ZNHZ4Sbr4m?=
 =?iso-8859-1?Q?OO4U9gfaK1KTc46GSzkEAS9CeL7TNA5troYvTwgo5Ty4u+BFvnDpsBqcH0?=
 =?iso-8859-1?Q?40OgCbGsFDV3jXZtGnYEf1qe6wNBDjZc075Vh2PnqsVNqPiYkjkLZCT418?=
 =?iso-8859-1?Q?GC/2goYNe1k4Ds7/XVU8xyxoZ2sk9DXDAqLLoRYTZb3Ln8SdKPpOZHZv7q?=
 =?iso-8859-1?Q?CDlOjC3fv2BnZrJHeqUYEwXDZoyiNKuTuyhChvU0kzt9bhzdT+UOFUsI0E?=
 =?iso-8859-1?Q?x5JMgqaAs+U1gTLPx2ze66tDNfLYEkKJYYvPANhLgG6ykBjvtYPtC6T8jn?=
 =?iso-8859-1?Q?/h62ae2xAWkeb2sbZ2TJ81431Md1l+h1HSeLhsO26CPwZxfRvssqLn6INV?=
 =?iso-8859-1?Q?+n/WsiBX7voye7MibVL1Yem6f84zAe0IYElHkh2qJeQpp0bjtBj6sigWA0?=
 =?iso-8859-1?Q?8bJGZWhpgC4zPHBcZBzw3Xaxxzzy2hR2Jt5EpGEEqM02tcxmbJgysraS7E?=
 =?iso-8859-1?Q?Z/K7g4BGxvVQrjkPR0ziBpd/wQBpB0rLKHACNkNVj6dqQ21b/9OfoYEnUs?=
 =?iso-8859-1?Q?aWuyCQmwgEyMOlvr1PKMPnyTaR5AZaHKWItig829geWHFSadh2Y4JykvCN?=
 =?iso-8859-1?Q?lxNkLs4BAMsKXPqJK9xxMYg2RgA1hMRnr+P1GOE1vD+MpI3Xz+FQ+iT0ji?=
 =?iso-8859-1?Q?hlYOQ5TCOn5Ep/664BFigFR7d3CabI4GQQBepi+LvPDiiNbxZItxpzRi+p?=
 =?iso-8859-1?Q?5J4Vp/O4l2KUvyITQW/buje1J0DGx1g+hAAYQZRqwIOqOn+d/LWEszVEun?=
 =?iso-8859-1?Q?pErBdH05/79ugcjZxoAFzKvP1WM0wT8QBo143iYXeCdU9Lq0gaDPYhPIX7?=
 =?iso-8859-1?Q?dBvtXgQ137MCupN2bHL9vu95w5cG3bBHO0NjbNWDvOxHhDWeyW/2yoXcff?=
 =?iso-8859-1?Q?876nNDOADtWCQJsrkhGgnJ5X/tIpnQbYDwnSvBrI5sFwUNYLFtywyfG2mW?=
 =?iso-8859-1?Q?K/A50LrmRLVvubt3nQY5dlmR0L40vtuRfIGmBkyCtyNCCDLMMfw7iB2mvj?=
 =?iso-8859-1?Q?BcZAA/xv9s7rHesMyrjWfvwDuPMOXcYzxl7A+svzPEkBRmL6eh3GOe+Vwf?=
 =?iso-8859-1?Q?HlcSqba8PXDgq6YkCyW65L6O/LjrEpzcCBWuQDs58o4PSBW4U6jyoZc39B?=
 =?iso-8859-1?Q?jZF6g56pZZEg/QG3py04fO2pRFYtwOggQ/AIyEwEljXAHo/8EmMdFGK8QA?=
 =?iso-8859-1?Q?qy4Z9arqihVLJ8ElhvjY2qCTFE9bIGuFyP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UgCF8i7VPWbeR9kUyn1p1YXDlOWSUy0RJ9QNuCv8lLtlgavuQo/Y90J6sSO1UzgZjzaJCTYtOAPtXHw6GOtnlW5ebhENQyQWNRIl8NVgU8ofAALL0lwMhi6VKSwz5msyr9qRZEpWUZ+2XjFMTIgil1j3DdcSn56fQKL54xaVXKAccOAOG6k0lOfUywWQNc4sTQPzvfTC1NkT9ZdZNZUM9sheyFalEPpplHvV+CgeKh3sYwcJtxLIm9VpRHY3WIbUFlTrDZ5ihdp2KyGw6tRNCA5eGQbzFFc7swFDluka3rfxhsdTTOOTv7e+vvhL4TkKjamdcUh5Naz9Tf6xla6aBsWDlikf/m4NSDOy1q5FeUVb5Lmg19hszZJfJMHqcW0vLycPPgdlI0SFVnZ/89oaKwnffnXDL9x64aZHPD4tsas5eM9GHHeb1F2DYeAF78ukJkuuZHB2VH4kr19nBihotaS9eAsdwvaTYCK6DTd7gklmbcP64NRlT2IWV5vyPPPuTRNlQbcZ48ez61nRho1TkerTnSLaca1+4q3Wwoeo6FOmm+ii00roc+E6tuvFdKve6i96BRTil6j9lboR//tVxBOD5grcioLys+UvEZQZSkDkeKwVYEPa9ZSHy/VAN6tO
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6849.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46004227-6a3f-411b-be83-08dd7229d9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 21:03:43.0210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+uTk9H6OZH919gkoigSU5CAcuce72Jml61ytcfMjzrQOdmducwrZ9qP7gJnvxUYVlKib31zPy2KHoRTm+382w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7153

Hi Niklas,=0A=
=0A=
On Tue, Apr 01, 2025 at 11:37 PM, Niklas Cassel wrote:=0A=
=0A=
>> > But to be honest, the code did previously=0A=
>> > allow an I/O controller with just the admin queue and no I/O queues.=
=0A=
>> Agree. Initially, I was able to use that hole by forcing nvme-cli to=0A=
>> allow zero IOQs. But based on your suggested driver change we don't=0A=
>> need to patch nvme-cli anymore. That's slick!=0A=
>>=0A=
>> However, from the nvme-cli's perspective it does feel awkward to be forc=
ed=0A=
>> by "nvme connect" to use -i <non-zero> for an admin-controller, even tho=
ugh=0A=
>> its now being overridden with this patch. We will have to come up with a=
=0A=
>> cleaner and standardized way to connect to an admin controller.  A stand=
ard=0A=
>> port number for an admin controller might be the way to go but it's not =
in=0A=
>> the spec yet.=0A=
=0A=
>So, with this patch which overrides the user provided value,=0A=
>if the controller is an admin controller, you need to use:=0A=
=0A=
>$ nvme connect -i <non-zero> ?=0A=
=0A=
>Can't you simply omit the -i parameter?=0A=
That worked. But under the covers nvme-cli uses a default --nr-io-queues=0A=
based on the core count, which of course will be overridden by this patch t=
o zero=0A=
in the kernel. I'm not sure if nvme-cli may hit any internal state/cache is=
sues related =0A=
to an inconsistency between requested vs actual nr-io-queues. This method w=
orks =0A=
for now.=0A=
=0A=
Thanks,=0A=
Kamaljit=0A=
=0A=
