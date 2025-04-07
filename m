Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144FE1ADC68;
	Mon,  7 Apr 2025 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034397; cv=fail; b=DZynRfRSEOBJNqpeLCuyNJxLWpUWOAqQ+ifH8Iw2j3d6w9SiUeqgQzQSWSB092EthgRtdwGvyjT6OWPSOuoPxtk3tNLgaskVJMGUl4lrlyHYlAjkv96gKrV2ve9/k29NEWftTsIBSy8FWfXOM3nrlDv2IYDe/5uaE6QjyQFLJmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034397; c=relaxed/simple;
	bh=orsuKSIj9Nd+kvKMwdZFhkeWWf3qNUuqoqyqycx4saA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VEuRJBSt85zaFVsaQEuU9BaMWgVQ3a6XmFET9O0/6Z/rellIAUGsr7iaG7R9hgd5LdgIw3yTM3dufuwN9FfZ1B0AoMrr3c6j2cSZkV4qCzx5aCJMEDAJ+gkCcXfOdKrLCpNDMHAouqHhB9LeKlDSwmqVjkGOvPoJRQBO+FQttHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MoRJ6hEv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YZeb0zby; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MoRJ6hEv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YZeb0zby"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537DGt8f006400;
	Mon, 7 Apr 2025 13:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=orsuKSIj9Nd+kvKMwd
	ZFhkeWWf3qNUuqoqyqycx4saA=; b=MoRJ6hEvi/jM/po197Sz6/A4p8wcZNyMs/
	mbZIzWJUJBw6kNUU4ZL1hMFMzpY4lqJW6UUJD3Rv+7lgztPwzeeAn02MesioTODX
	uFJIIvtajzd3SRa49Q2ZJGgxS67pr3MXkjfebX3Oag3m0PfC2AhgzdPJRpCuLyOp
	UepxJ8z6gtv58Y3K68YP7xyj6bbQokgP0lOa1LUNxZKVHoaQ/wgN327eADY3nB24
	01QUqhN3aZZRAVXacrgyLpVhUSIOFNPTDqoRhXizExyBDHxO9Lka372ZnjuIDWmd
	xshfWftfTwXFrh5RmRCYCEu0AevObCE/blnrcrFb7ZuSomF3ThgQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvjctp8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 13:59:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537DSEfp013695;
	Mon, 7 Apr 2025 13:59:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttye3aap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 13:59:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVfmr4MCRtbLTsjRg5zXYd80kPzht6NtBToIQkK6IDlA2F6Sv0okn67ugZdy1h4c/eZIQHOPmcJF8C1gd8Qh7fbB5Dh/ru/d5hH4DqbsBjMmEp9WM4TIcWSYS6l35J+8mYXObnQBxVYcEFS2yDEp+hDL/rgIwiVijVh0UPOJZgjF+tqWNvHfAu9/VSDlSFCq1ozdNXXt1Xc5yAkVaEG+ewjVvTtSJwNotVLhX6IAhcBaXOJNE+m15g3ScQQkR4DO9o5mmnmYYqePxroDNlcp5wHVRu2uK3lCMNtro/yotlyts6T4VNEQGom+LUhS6Uk43JbrcLnOAEko7VtM8CtGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orsuKSIj9Nd+kvKMwdZFhkeWWf3qNUuqoqyqycx4saA=;
 b=YZygRSsDID5skA8ppXkPLrCHmKoJbeprs3xAh1lwTwUuiw1mLMRSOxdgww4K8XLy+C/fFmUY9W7NAbjq4haVuGsuIFvwDnSVDz2m4vQiEVFWXpNE6pTnCWenHTLuP+mongZhYCYdAEIY8UpuMAcLlUtIfMpuqQ0cemkxOc7/AWLvEvAyfolJmrk1yhSc7NPn2AFc/8ctriCkionGo6gT4d3XI+9DU+nCf3Uut1ImTqi2SOJ56No+dzc6kXHDiwK9SB7aKhgMtoy5mfp6shtNPkRX1kjHottZ8zx877lc/oFBqWF+9Fzg0ah29r8vjWrdSzmmXEVSASH0UaAmI6eV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orsuKSIj9Nd+kvKMwdZFhkeWWf3qNUuqoqyqycx4saA=;
 b=YZeb0zby9rndGkqkCG+Wq7GEEunQ4kaJCIfEvyiDYNbei+2RZP5/ZiCVWHEtbLyXC3sFXuUFSozjkjQ4aaZ2E14UOqkMC3SiOB6DbC5DUD1RtC2obB8sg1LHW8vu76WVO/YwtXDiesYlDVWR8VfxxklFKM9jOIjvU8udH511RXQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CY8PR10MB7124.namprd10.prod.outlook.com (2603:10b6:930:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 13:59:26 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 13:59:26 +0000
Date: Mon, 7 Apr 2025 09:59:21 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
        a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
        dakr@kernel.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org,
        wedsonaf@gmail.com, brauner@kernel.org, dingxiangfei2009@gmail.com,
        linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] rust: add maple tree abstractions
Message-ID: <cons6o6begjlf4eu3wvhplimbrjtns553nugtblki7u23a3u3p@efca7vmgmr6w>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, wedsonaf@gmail.com, 
	brauner@kernel.org, dingxiangfei2009@gmail.com, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, rust-for-linux@vger.kernel.org
References: <20250405060154.1550858-1-andrewjballance@gmail.com>
 <20250405060154.1550858-3-andrewjballance@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405060154.1550858-3-andrewjballance@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CY8PR10MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: ed41d15c-aab4-4572-f931-08dd75dc6833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LWpaVYcsh18ygJP8NCykbwW0vrmyeFhcYXELLFWLPhu1+GiBY1wWCFwpjbMF?=
 =?us-ascii?Q?JBiXPfCqB5vscueEMz00ev4pQt8fLAUvbFqwV1PyVJQr4PnTUr4zahn41bS2?=
 =?us-ascii?Q?wUtDtwMibhSQbLLgVVX3PDcXfsjcSRixWA/uyC5C+zXQW4vH3dym5p6eQft/?=
 =?us-ascii?Q?Dn/Ol6Otj7590roIOwzCfJceWrhCUM9EBA5TGL76q/gJo9hST0EmLrDxh2OV?=
 =?us-ascii?Q?3NcBpE+RwEwWJonk1yvDscFqrjwjhSTyjLn5y76akFBE1G52aQZx5tbzotKk?=
 =?us-ascii?Q?2/KewsJXpMibzbjsog4S9QoF8nhbWH1h576KWkxkxsuKAPwJ5d17PnL8hapE?=
 =?us-ascii?Q?ZOWux6Xt2MmVepfw79X3wrRtb6fs0VU79mircZObq/F/Ta/k+MjPMnsNRbgH?=
 =?us-ascii?Q?s2unGEdI6EXurl/GV6F5WM9tY7oQqNgC0AYjFxH4jTMm3knXJsR58B3ALlnz?=
 =?us-ascii?Q?ApFjbnpOvKl6kI8qcyjuJq7gMYDkKnCSgN41re82v2e1+opGb/Tx+0m0sylN?=
 =?us-ascii?Q?gcjjJ8sltUGsdyOYCzg013oWBcuTUksz5nASQZ4wfvzlV/6IYq4CmiEA57w0?=
 =?us-ascii?Q?s1+m3tvnXGIjKOURDbuN2Gg9ewzPSdQMEJ6LoN3Fn7EQKrV+1sJbqnWhmwlr?=
 =?us-ascii?Q?L1oD6WrT2dY/8adIOUGpXPA2+m1oJnO4BCoxjNDyCBmj2EbbqmYkRjY3g2Qt?=
 =?us-ascii?Q?eoBDt0Hfy8SAxt6j5NQzJM8fahl5hwkQhdLvnJKLeQGRm7LhyD5c/FaT9hbu?=
 =?us-ascii?Q?0iYa3C6/nCfzQIdoSSeTh+vTdCH43GYM5ollum36lnbjvHu7m3agDgBSkQlF?=
 =?us-ascii?Q?XSwEsACVRD4bhgo4RWvk2WSJxyc/fP3gYD3z2pmNiufxT9K1h7U1SJj3GkS9?=
 =?us-ascii?Q?UAEVs9OlGCPc98vQZh9nLQ5o9tR5aNQ/hpjyLvgMzDgYWbyvEMuEoVLL4JDl?=
 =?us-ascii?Q?2MAivuG4GK5K9r+wZxG8EZErv1CGpyUv5rmyMwGPcy5YBf1JKWXV+G8lakt6?=
 =?us-ascii?Q?joQe9D2JQzBH6wA8tJwaYD5OHR++Z+apKKFlAfqUMccrWzGB/mh7R8tmI5as?=
 =?us-ascii?Q?FZfi8hjXj2y52K7I9NgDzrApsgmZAdP7CBuk+3qlIh2xbDP5EIT8vUoKtbqx?=
 =?us-ascii?Q?TfWG10M51uDlyVZI42g4nVoIF+QP+MYmL3fFoRa0etYQVy0yowCNu5X6Cx4F?=
 =?us-ascii?Q?hkxjwXOUi5u8jnr8ooxj+WWFui2HrYJZmz+TPsUNVjrw93rGVR3R7vOusN5s?=
 =?us-ascii?Q?O4sDxqrkZZMh78IZW4/EeDES3JNXNc+8qUBNKsM/BIdzroo0OvMYf1Yzw355?=
 =?us-ascii?Q?cYFMd89e8hygyrIvB3LbF9/9B193rBL3bdJ1abXu4ncFLhXHrARDCNocO4/x?=
 =?us-ascii?Q?yiodh/IF/VjqZGvwJYrsw9VRlVpt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zcfpDuD7njPd496eCyDVw2Fkvw7FaW5+wohbrS2BEOP75RFd75NWOyZjMwX4?=
 =?us-ascii?Q?HPcqnSTt5cIfibfTZerDsPkFS5ED2vLr0kTWL88Uche1r5ISZLSNHDWCb5Jr?=
 =?us-ascii?Q?ug/CIH3ZPgxmntMnmKXKZZZjDgCl2JSELibyO5dFP+sn6dUjGS9NtQz8WPtb?=
 =?us-ascii?Q?xjOnj/53W6SFWKqz+7gE4lU0UVid3FEBXsKbW3VdC/RggptjChgh5i7RRtLT?=
 =?us-ascii?Q?q503cZIVoApRtOhu6RQbD6yOUUTxc7WiRQQWHYld4hlRgfXuyCNfPPFFTMOb?=
 =?us-ascii?Q?50P+muDtsh1gNhoSTedgcZaJCWId9+4nwqf+jpOqhle9mwQBJK86EeccOxC/?=
 =?us-ascii?Q?81XfMaZuc+mSOqy/N3h1Q601aOemiXZ0gRssVrPNrHw/ns6/PA0/ZBF/ipoU?=
 =?us-ascii?Q?JT21WtLh8m162adDjEtf7I+tAFDaM5yPFS5lzHVOLE2lmMmHRlQO1RZVgqX6?=
 =?us-ascii?Q?OhCgRrI+9AcEFFlhEx/u8i2Jx/nJiFqeva950BvYvpv+6lRLQ/GNwnuvzlBR?=
 =?us-ascii?Q?My7nSrsWwYReOo0DhZhsItC45M+ZVtIqH0Y0h4oxzuLNOaPEBZGmorljIF1W?=
 =?us-ascii?Q?tGahLGRvHcfP+w9LlWt+GfUwiUCd4uM0vagIHHbkXnYJeC55D4XbJ3Nvxc6T?=
 =?us-ascii?Q?oh/fGEwC7yJekm5jYu1m2kipoUIbEp6gxuKIgbIqmCxiB8Xgx+xNDC4EiymM?=
 =?us-ascii?Q?XuvnzZFpw2Vyp7gNUEScupReapwubNf1KC54bOXlp2LPfQcP0vDRoKmTAOL+?=
 =?us-ascii?Q?4fa2+9LWLKH9fkbd8umwo91ymU4aoeJU80x8D9fqxJnuAD3C/IHlfDV8BbxP?=
 =?us-ascii?Q?kfrT/PebegfxDE1JVvAS8/5X5V6JkNSDPvZdP06oAATojA+dEb11PvAAJ71W?=
 =?us-ascii?Q?faEtkwhD+DMBMXj0bX9dseGVVMGmotOGqgh2SPdrSXnovRiCa3rfHw9nvWaN?=
 =?us-ascii?Q?HrNq0OEPSQcaj0jfk3KPYRyI5gI9+X19i5kq3SHda61cZhTd6qfvNr6F65S+?=
 =?us-ascii?Q?diev51wJTzgwhtI48SRkqXjvmaHHaBf/EkrZ/0CxOfFAhGSxm6lBwrLhYiuM?=
 =?us-ascii?Q?TWxLZOgnx4iNruaz5hmB5ff4RMc1J85O0fI0cy9t+Z6JzHJLD5zp3eRAZ29M?=
 =?us-ascii?Q?59XWqJwYHOshLWmWw0nqeJvrWcmN7NnjSirbeZeWMKM0gm1NlxdHvVkF3fGP?=
 =?us-ascii?Q?rIrLANhSrUHHY+lOwm60+KaTZCvFbKr9M85JUCuRJNqcXq9aaebq+kBXV+Nv?=
 =?us-ascii?Q?EQ0qzbV8tJn/rSW5XBitIP31kLW6srlySeTZx2jrneVgyvg2JRlfnmOQhcaX?=
 =?us-ascii?Q?S3xdOGdLFbr3vqv1gtwq+5DSqcZNh8GBs16wpJuqeaWTgL61+MKOzEjcGIb4?=
 =?us-ascii?Q?TZgD94BudebX4pepxajRFD/Jd+peGyoFOU+7sjWdgsB2keFblk4Vawi7mZY2?=
 =?us-ascii?Q?HXFPUP4K1r3j52kqCevvZB8M9rcIrSRTVAUB2VUc6o75oaBvzYTN2uE0Ux7D?=
 =?us-ascii?Q?Xlzb+oeqCuQxvmqvUf7hBNIpYtFqaRLxHYE02CMcEEGDq1286HTC1p+M3Dws?=
 =?us-ascii?Q?OuT4Iv+4C/AK+XxyNB+yG9VHqwILqsvvQjCpGkue?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u+cqZ0W0ZUD8PKFEri494ujObStHBo++Wa8l++btAH+dKtxE0L6y9kI1azwksnubZqMVDfcz2eslETY3uvAKukPm/k2Gfinbk2KGIVLVyjfJT8OQRNJjy9NHirq3twEjbK5m253kEknwQKrHJcvBIaKL/JT2dBvVUnAsicNhk0Zkq/YSFpRovg9kjLofFwtrzMnHN4nVMvVKju5ejiBh6aRbAJCPe/lbmgh4f2LvKsbnk2fBza/5Ld4nfuPfX1Hr8tkLNx6uGgGjojlAi/DadRI1acN6Qhc4DsSaq5ATHzLRLu/eZBT4+fP+9gREf2k+0nQ6FDQ4+SndJdQdM6NLGpxdh1FVtvGnzoMzgRrgXxFu54L6+1Kf2JhgrGjMN71/unJvQ4/av5za0AQZBkohsgTUGMcT0mNnQ6ydJHyCasAfjRvd7pN53EGQtYoiZxUZGguSL5waStoVR0NGteF1ZqiBZAHMym4Sx/Qb+Lphr8fDuX4H/HpYdRW61rlac1muULwt5afoGCwmT/JxJKeMRrxovx9Dv182GTQQPsNZMQFYLXCvbR/mRzdBSD+feZiFY+YFT7Rx/r15Ww+AfFaRgoRSUUbS0v/gCMTcAO80hVQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed41d15c-aab4-4572-f931-08dd75dc6833
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:59:25.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NHqeMAgr1C7CLebF2Fr3htPNSleDYoQ7vZRML4bqwEYPgBKG1CYcPPu3CPXnp1NHLVnYx91i29UptCQFTIHWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=834 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504070098
X-Proofpoint-ORIG-GUID: w6BkVRAf0FiqEkLHWBwO7-MbzIvvklxf
X-Proofpoint-GUID: w6BkVRAf0FiqEkLHWBwO7-MbzIvvklxf

* Andrew Ballance <andrewjballance@gmail.com> [250405 02:03]:
> maple trees are sparse array like data structure that maps
> non-overlapping ranges to pointers.

Why do you think the maple tree is a spare array like data structure?

...

