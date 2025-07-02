Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837782E7BA9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481555; cv=fail; b=fGgiE70uoiOEC3UYInKr5IB+FkJe9qUy1QQvETB4NwvmrIXDlPFfUDFrsTOamn4Dss2XvcRTp6rXjpA92iv/df2hE2U5uCb/TAreTG7A08ZBBF36IN0sPNQrqPks1pwRIitDSQpXp4C7Vxz0jtu9cSsQj0GqSbpCvGdh5XDgZvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481555; c=relaxed/simple;
	bh=bfiHSkw8HRTwct59z3CMKinTj3OUN86fT4AD2/zc9Hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fMDb9vDiBJpgJfqPbTFbfrVvYqEz+nmhNfLPyIM39Tkz3WfUWr/Vw47ef8iuS4xwllRpd6DXnYonSPh7tCpnes6JXXWzhk24V9M/isgah/HvbJO/f6b2K7cPOsA4mD5GGRCPkNUVOcSwazGY9bEvKEWoUrUZqGXYxWQAPN92kW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=N6XEcLPN; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=spD6ScZL; arc=fail smtp.client-ip=216.71.154.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="N6XEcLPN";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="spD6ScZL"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1751481553; x=1783017553;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bfiHSkw8HRTwct59z3CMKinTj3OUN86fT4AD2/zc9Hc=;
  b=N6XEcLPNfpsDE2Aoc+YaFiHbXQN6fuz1Glv6XnNQX8oDbZ+gZBikfFOx
   23RhVxfGXp2absl0nVHCR5/Rxb3tygOAO7e2ehSdOaqOUds1AUqF5sQBi
   qrpV301TDWNhPAho5ui7x90UC2M4eHfsTyOtxfOJZQ05EEqrTWR/i0zhN
   JE4uLCi/Cag/b8ceT6nvC6m3hXogfau1AK2XCrvYF3uKl5LvaXdoJroM2
   qmh+t+eCCksrrNqbJi72fZD44QV6ITlpJcsyuR8Ouen/SEEMNsdsub+WC
   cZ8bTyApkaQ5sqrnbWLIelMRxBuCxn8GwFUUcri8hR3cT2kZJofkKNnd9
   g==;
X-CSE-ConnectionGUID: g9/da3AYSjW298z7MsJogw==
X-CSE-MsgGUID: Q4kYViHlT8O0RKjher9HPA==
X-IronPort-AV: E=Sophos;i="6.16,282,1744041600"; 
   d="scan'208";a="90577453"
Received: from mail-eastus2azon11010018.outbound.protection.outlook.com (HELO BN1PR04CU002.outbound.protection.outlook.com) ([52.101.56.18])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2025 02:39:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjGzc2b/vZOMVPk7OMvgMqOj9wWr6sfXigBIn7bGsITKi6O+ZeNdDbh8gM18lgoj9VDTBo8G+4I8YxuKaqOX62GrEC6v/Hp4smtFtL3oQq72qwsVbbN17qhhz5xD9XiUCdmRiMl6zs9UIRPswW2jNLj+54CHZPHaRiuQrHe6eFY2mtJZZYM9rynyvBrvnAd7V6jo38yidLhlJQsMSlZz2BhBE7wDFp5jV749vrUNdkQvbPWvfPrigDgi9wJpZe727o98+Ga6MVn1l1FH6p4Kto03u0XJFKwI3dSpxl4SpB//hnIH4MoO8GWMoQ5MtlM0NBT3GtQg52HrrWNHTnvd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfiHSkw8HRTwct59z3CMKinTj3OUN86fT4AD2/zc9Hc=;
 b=CL1fu7pvAj30n7/+0JB7oj5l8yKuoZlRz4d5vNH9lJ3f57q9CbxawvO53LeH1nd/aqnOBPOJAMAWzL2PeiNVsrFxv5q13v+7yLNU08DFD+r4I9IVK1m8AArXroUaUc3zWrycKjAggCH4vHEdksLhCWltjOkstVH9ybG8UeEgWDcQfNPQh/eBERPbUS7Le+bmMw8Yg4Xm0gGkFw3oscqUbHnanF8FTezF+q5nvKi8OUraW26k+OgiDCG0sK8b6ENteM/GUcD+OVYYuS51Yu+rI07v8wZNJyWNHrPKr+1lb/MHalPGexfdiWSF8xiJjkcmBq3bHS49HTx0Ll69IDdz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfiHSkw8HRTwct59z3CMKinTj3OUN86fT4AD2/zc9Hc=;
 b=spD6ScZLZutixN3YrIF1P/OBlXvE1qIX+lY16pABqPR8S2N2vP7hJYVWuwRTvSbyYK8NVuRQMNOi0RQgNJYnTTBc7xGHrqLY1zfsAxtR5aGTZkFARD64oelA2GdrlmPY3NHt34nHwn5ldzFpuuzXdNA30tzaz3g6rks5GqVHAj4=
Received: from MN2PR04MB6862.namprd04.prod.outlook.com (2603:10b6:208:1ed::18)
 by BN0PR04MB8158.namprd04.prod.outlook.com (2603:10b6:408:15d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 18:39:09 +0000
Received: from MN2PR04MB6862.namprd04.prod.outlook.com
 ([fe80::67d7:8033:78e7:9eb8]) by MN2PR04MB6862.namprd04.prod.outlook.com
 ([fe80::67d7:8033:78e7:9eb8%4]) with mapi id 15.20.8880.023; Wed, 2 Jul 2025
 18:39:09 +0000
From: Kamaljit Singh <Kamaljit.Singh1@wdc.com>
To: Damien Le Moal <dlemoal@kernel.org>, "kbusch@kernel.org"
	<kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, hch <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "cassel@kernel.org" <cassel@kernel.org>
Subject: Re: [PATCH v2 1/3] nvme: add capability to connect to an admin
 controller
Thread-Topic: [PATCH v2 1/3] nvme: add capability to connect to an admin
 controller
Thread-Index: AQHb6uxwHiN8wQJfJEWAQJueJuEnz7QeF2yAgAEPGpI=
Date: Wed, 2 Jul 2025 18:39:09 +0000
Message-ID:
 <MN2PR04MB686294B136454530692AEC1ABC40A@MN2PR04MB6862.namprd04.prod.outlook.com>
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-2-kamaljit.singh1@wdc.com>
 <22f8ec86-2d50-4237-9313-79bfc93c8e3d@kernel.org>
In-Reply-To: <22f8ec86-2d50-4237-9313-79bfc93c8e3d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6862:EE_|BN0PR04MB8158:EE_
x-ms-office365-filtering-correlation-id: d0a8b9ee-a806-4fb5-dad1-08ddb997bb9d
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RAwDKpiS/ZXA5+WelqYGTOWdN9GBNbGnacfaU7kgGHd/MoRFJ/3KD1SdM8?=
 =?iso-8859-1?Q?JCAVEd6bSiBPUTNSlqzwIG9bImunkAfCaA966AHvVY7f7AGgI1O+6jcWY3?=
 =?iso-8859-1?Q?1+qhz31cLG4+QmN+fjgDqpln6hKKXRdX70+hMmU4RHbkthJ4qCVYnTY+rq?=
 =?iso-8859-1?Q?C28DYy+sQR+0ifLqVain69GqP44UhEmhrKEOgaQynWcj9AUGPvpe7RfgvY?=
 =?iso-8859-1?Q?7+cOKl2BI5e9dX8gI0aa5qaXy456GhfLzmK/Kl3DQpBp/XPlto1VNrp/T6?=
 =?iso-8859-1?Q?Y+8TN5qs8DksA//kwif9kllOz0J5mWi0JVZooaXOCwHo+tDCvR3b53us9t?=
 =?iso-8859-1?Q?fAXtXsLXsuNEO+Rrl9usVLC3A3IADf8Glz7BZ8bMuBmP3nh5AKvUdlJCA9?=
 =?iso-8859-1?Q?JxA7hEs+C3Ensn4g/ai1JHXlxn5aqXIFAL7bN9d1mQGGeU39PF8jTB6mET?=
 =?iso-8859-1?Q?s43ZJuOEra2Nx8ClHMQcMx2iTbrAj3MwaC1e7OoeSNYBIc4C0f9APddzkb?=
 =?iso-8859-1?Q?9WyvJfQ4kVJKWtbYNMWcEnOjU5P0oNG8//WSphKq3vo0QbWuQl98NZWwSV?=
 =?iso-8859-1?Q?pmecH0QhgfRkltB00OA6NUh7oV/b4nbOWdYe/ihOAIsPtm2G/IeYcZ305n?=
 =?iso-8859-1?Q?Mg1i57H8TrBEFCgrCadpgcDJr3RKUaHREG1cjSj+u8SV9dU2PU04f/EYDP?=
 =?iso-8859-1?Q?z9VMuT4JBfgqOKVXVMVjBnY/y5jC0qlcAl0FM9Pv0bT6qkiacgXD+kArq/?=
 =?iso-8859-1?Q?26V32UQJamlN10MVHmv5RCDax1uwJ0voFBezonj3KTZh+ynjKkJvTi6YVi?=
 =?iso-8859-1?Q?8qxyEOxbcvFSVDO7ruCdXW1ggrm+CQ4AoBo0n4QLYpwma4N+dogd9FAMCk?=
 =?iso-8859-1?Q?BezQuLaKMaQr53LQztrbp5P5o2iI63JMvRQyorBbh3lmmAtcbZwgJeId8N?=
 =?iso-8859-1?Q?CBjnN8rvZRde9sDtvqX2pXdVgw5a8njXu+o7tPp/utBXbDsSNUWxniJJ+3?=
 =?iso-8859-1?Q?zdUGIRG6tAEhjKX6KAedK7Wgn0Sbda1O/ek3Wwk0p/COYI5gGbIKGI13L6?=
 =?iso-8859-1?Q?qhRjNM5F2cH7pSfHlKXMCbCgN9RRXve9liT1wVEbyMQU67Jbcgwuz/Vds7?=
 =?iso-8859-1?Q?T9XVvwrRFVxiO+oWD0R7HsoJuaTya4H9LaA9NejYuQfCy+25cqWjoW8Mam?=
 =?iso-8859-1?Q?D1yHFWl8rR4ePT5gu2h79P+zDaEIlHppf4igmi6zU3nplw8fEZuz/1imSu?=
 =?iso-8859-1?Q?kxf2RDSaBuy0uMtWayIm+Xo/DVu/ASHpLpNW85zM0ywrQc3ngZF0SueI1D?=
 =?iso-8859-1?Q?DhkVh5zTbk4OXjYhLO7bf6OowzzC8TPIrNizaBUi1KyLP9fjDNNRZp05nT?=
 =?iso-8859-1?Q?Fte73YMjxVaCdAafXeyXqTK8z1RAx6BEGTjX01a8IP3R+C4GJkkT56Gr3T?=
 =?iso-8859-1?Q?KqDNsiOTmNHV7JEpdt7JJzrr/R7uDXwLqbu1RrbAx+Wi/jDT7nNtpaFnE1?=
 =?iso-8859-1?Q?yz5uVYuHFULkTe9kiJJUrpRsbCQxq/prLI2RqKxpC3Yg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR04MB6862.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vxjRMNFriWV3qMVwxr/mnhlcCuUfeAHVceBZeOUTL6ym+j4v2sjGugIr3G?=
 =?iso-8859-1?Q?+hkF9dTj6Ycnj4hivFB0eohPR0qQnIJVxpPF7nzHePkNAJ0qKfqxhwJJO7?=
 =?iso-8859-1?Q?WqwrwIbaTxp+k+KueBhYydHDYq5P9El0YzG/Zts0l0SNVq+oLpYtdQ2yO4?=
 =?iso-8859-1?Q?GyecJ/WjVVvAEFabBxawdBsjtZnyDjltyoRE+40FXM3JyviG9nUjHZZDpe?=
 =?iso-8859-1?Q?L3MRDaNGHnrolQImR3mLzojAr/Je+FRCD0EmvQkFFyEeVPi6v3BUsL8GZt?=
 =?iso-8859-1?Q?0IdNa92veaS4QQ0klQXshbNlN+0UfT9TRbyHifqOvfBcVR8QRYqMgVYIOz?=
 =?iso-8859-1?Q?EPXpywc/SXfse7DBsM4xfWrgFeBl8xOBqLq2FXuhVdORPXhYGwja5Uo+KL?=
 =?iso-8859-1?Q?6bq+Og8KtBNbdR4gAV8WMjPyuJ7HfI4klMgiRFp95JB87pu6Eqc4Mj/Ax/?=
 =?iso-8859-1?Q?C6Y1yfaec3T6/WRiSmcBhOhr2QetrV3Q9lPjj8TFdtAIbvUWe/Ih97Kj/p?=
 =?iso-8859-1?Q?PSWCQcFuswK/ljQ0zkie0/cu8BhmFYRBDe20amp7vrkNI7ccz/C0GQLvdu?=
 =?iso-8859-1?Q?VYl7sl/33qX+jwHJyXvlzc3sscsioxhjtAKUGwMnzt3nOaC1bub2hTGQDQ?=
 =?iso-8859-1?Q?IoqEEdlXP71HcJ6A9wWUeLDlLzY9NAl86jZxSi5Iuz8q2Yue48oY4Wg9pV?=
 =?iso-8859-1?Q?8sMzh2rq25ojjSApq+XpRJVdmFMuQcRjYPJw4jYUcQeHOpFBN7m3NvK0AD?=
 =?iso-8859-1?Q?XNgRQ8BobJuF5AiSZD896K0KHs0rmr5y/T4uRsjKRdofPNn27QiqIY2o7+?=
 =?iso-8859-1?Q?2M5WyGgXyTQMsiq8HYgmIS64pM4nPwA7IW4ru0BFrzNJJKhWrMPGE3Srx6?=
 =?iso-8859-1?Q?OIbh3YUWyYVJtls5gXZtNL9ubumkJIDvL1EP/2R7k/L18vkN/zkVmmUWts?=
 =?iso-8859-1?Q?p8UfpCw3e+TsMufA2eq9JPWcaUQq5UzmxA1ZrBPJ4hHXR43W3gK7EVEQn6?=
 =?iso-8859-1?Q?/h87vBlHjceOHZO0vfLGmC81TKToQp39bychQdWCEPdn/mUUxhF77JQ5ad?=
 =?iso-8859-1?Q?7cYgPQ1MVsPUhbXXpsx2pGIznGLB92whATyG5iWjpBvuXbfvWQpliXKUJv?=
 =?iso-8859-1?Q?rBmDMVe/no1rgylVZQcmU1vNzMJHqG7i8URB1Iam1z78Wl1gMgXuJEJNFC?=
 =?iso-8859-1?Q?/MQkpEIaiZ/vb9KStdHWG2ZsxTeeV8aAP1lJB2rQRtfuTZX0cHCGVJQ7Rk?=
 =?iso-8859-1?Q?y8/Ui9SxQnmCLGMRGwO2MiY6/ts+VEuJdT15UG+APE+ZxMm+th4J0EPQEG?=
 =?iso-8859-1?Q?DH6t+qAYYu8JzoROUjnx1IF1tx9kayyFVZyXQJj2dnzF27zrn6J9qLI8T9?=
 =?iso-8859-1?Q?cSsDPumRSu8Kxxrl1zKOet8OmU0FFXNAvgPvAXvyxzJj9fQu46OTBc8ji4?=
 =?iso-8859-1?Q?OxRGJLkMglFxQsEqjzNnfF1oTl1uH1ctVhXXud30uzGIr1a3h9gTyrd+gS?=
 =?iso-8859-1?Q?6/VRb+p10udLBi19Cp5nZxAFWz3533mSI0neNRK0bOfRMSCqQCvD9RBWwn?=
 =?iso-8859-1?Q?l2O8VgKXMGAvx0M19ptH1BJ/yhhSY4A5FZv/tdXA9gE6FVpnO6Q5XjP0FQ?=
 =?iso-8859-1?Q?t4vAhqSinUzo1PY8QCF1SIV0vIajplcjp7?=
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
	mVlg3/ZFrlRL1R+cOECQ7qrZmwORXt0rf+JWJg9BhLr3rwvzig8hsA90+xu28cEoknlpdHLzQllVldiYVBj8AAMvUawyB4UNDxCUbtOHr46quF9bd0B3pGir7k4nYBeGhUoIFjXzZ8w/QwSbZEx2VKij3EiHPNrhdvRN7ywnJAl72s9+j7cITsSya7sLGyaWGTKgVOfaHQp/hbViZpz28+3YqRUUbAEnVTKFyUzRilxz+SstMc89rtbRPtYWryZ7CR5wNRsLFv3lvYyDIjv07zzOD4SdMXbWEkjex3ARrq5JaYJ5r6mgLiatf24KTRlWEfvGBvq25LQkTLFTjZUMue9gN9xz0hVvavbmaUuRffIXqEavZycY5twN/IRo3Y3+ljilE2vJckay+Ig56dv2+xnFyxP616Ra86wNukisfLMus4R1ubn5mRJb4DqjbqrYmEq0jlTVFuvEiZyaO/1hst1eoZTJwY6P4blBYPWLiyfMTJw9FXCDDIqrdjCK1/MIE3ZqVtoq3YIBJexLxVdfkmMdOM8Y+jCodrXQChQNq0WQ9raXhP117zUgS4aeMBBcVZ8/lzFzBNfni7fgA6dP/zk4+vJF/c42XLxGI/N7QxVKWi9PuOTNpFd1KIqcFylA
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6862.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a8b9ee-a806-4fb5-dad1-08ddb997bb9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 18:39:09.5321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDtSjIgF2TIUn3EO35OrKcOjkSzt7yyfK/E1QAf0smoew9FMwZ5EClBiwKi9ox4K8qZwr8E7AuqElKinUnZ0qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8158

Hi Damien,=0A=
=0A=
On 7/1/25 19:11, Damien Le Moal wrote:=0A=
>> +static inline bool nvme_admin_ctrl(struct nvme_ctrl *ctrl)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 return (ctrl->cntrltype =3D=3D NVME_CTRL_ADMIN);=0A=
>=0A=
>No need for the parenthesis.=0A=
Updated for v3.=0A=
=0A=
=0A=
>> +/*=0A=
>> + * An admin controller has one admin queue, but no I/O queues.=0A=
>> + * Override queue_count so it only creates an admin queue.=0A=
>> + */=0A=
>> +void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 if (nvme_admin_ctrl(ctrl))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->queue_count =3D 1;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(nvme_override_prohibited_io_queues);=0A=
>=0A=
>Why not have this done in nvme_init_subsystem() ? That would avoid needing=
 to=0A=
>call this in all fabrics drivers.=0A=
Like I mentioned in response for 3/3, this can affect other drivers like ap=
ple/fc=0A=
and I don't have any way of testing them. If you're okay with that, I can m=
ove=0A=
nvme_override_prohibited_io_queues() into nvme_init_subsystem(). I did some=
=0A=
analysis and nvme_init_subsystem() seems to be covering reconnects as well.=
=0A=
=0A=
=0A=
>>=A0 static bool nvme_validate_cntlid(struct nvme_subsystem *subsys,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct nvme_ctrl *ctrl, struct=
 nvme_id_ctrl *id)=0A=
>>=A0 {=0A=
>> @@ -3215,6 +3231,11 @@ static int nvme_init_subsystem(struct nvme_ctrl *=
ctrl, struct nvme_id_ctrl *id)=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(subsys);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>>=A0=A0=A0=A0=A0=A0 }=0A=
>> +=A0=A0=A0=A0 if (nvme_admin_ctrl(ctrl))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_info(ctrl->device,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Subsystem=
 %s is an administrative controller",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 subsys->su=
bnqn);=0A=
>=0A=
>We do not print an equivalent message for other subsystem controller types=
. So=0A=
>drop this.=0A=
I left that msg in there for debugging purposes. I can either change it to=
=0A=
dev_dbg() or if that's still not likeable/cluttering, I can remove it.=0A=
Please let me know.=0A=
=0A=
Thanks,=0A=
Kamaljit=0A=
