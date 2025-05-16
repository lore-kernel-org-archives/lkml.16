Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE386250;
	Fri, 16 May 2025 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747379133; cv=fail; b=q4aBXbdvITSHwfDxt0IfWelMc2XyURdzMsEtwJ2AiFM1U636tRtwLvDr81TG2niWgsBj52e36M20rw+NXAe1iXwUUwAhRaw9r3dYhQywunlZRxUFpGrNg9egAURSSCL19szM6Ty1YTDXLvryvWHjiNme/n9O0cTitZjCAcKIzto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747379133; c=relaxed/simple;
	bh=Jhu51ZwAAvC7OIJ6oVKSJisO0AnMrSg8Cr2vE45LO88=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LUT0wM44unSLBodYowtmAZDW39jCoDJZV1YFwZmD65k6rRvcZUT72dIYdKTB2byO3nhlPhWNNQmHjqqw9Sig/ugNXwLhrUeIi+5M4WLbLx536Yh5skYm12KVo1+q25aYN9FruEaZbrgAfIRyo63EagxgIv1i/RUbmTf5i+sCwbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R8WWQlac; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R8WWQlac"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reD5+F3xs7YEpZGWLLkNk7bCJTC4138f2tm9pfT4pet0blCO5PSISF6EllgUT1MFWRG9aQhF6cx3wzESY08Yl3eVM8IeqJo9Gem4W+h0HROxDVvFm6h9xAhHXG71ofyj3iDfQBoBRXnPaiv1Zzon+XHIyeOyeZJ0Xe5XPrv+8fxbmP06uRDtz3rGdM7WUALTL/hzzkIojn6ON9xRo/JfEMnqW1CciEc4b9axKkyBQy/CrwoBPRcunA+tJTXfdtdjcnMxU+Dy8v3ic88xu7g5YQvGhX9pUAE1AlvVd48Kb8//DxG5cnSjHQS1qwK+tT/b+8bSFr2BVNbErvskhdn7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfH4FwB7pj6Bm97QAv/fYMS+dv7LJDDxHA1yv8jnDAo=;
 b=rCbL5ZQwvKC5wfuUcp5LHhl7w5aNsTZj7dMljwecxh0n/mGtkwZMC9Q6FacU+fQRAbkaizLdIQw8ghEBpsZNXiByVEON5mDMZeipNt+lD4omqeoPMJMKbmG8bZnoxti1HHq1OB51fwSir15GPljIYUNoZAv4SXt9ZdF/ChoBAjta8pO3SK6pPQlis5duSudJq3G0aqNIXw88mC2oLIbdKWMtkOkHXy3usK91y3GgFUWiLOnERC/g7UyNHnfMFEsZ2LkeRKiDUBVuQrjutp6JzjFMKMLQr7CD+yUjd9H3MxUq5jiYjQ+e1iSEB2wmfwssC+JYc765Y5Pt+kulV26xGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfH4FwB7pj6Bm97QAv/fYMS+dv7LJDDxHA1yv8jnDAo=;
 b=R8WWQlac/CA2yVW5x4srdQWB42VZZi0DH6ofR1GOH6SqV8usFaz/8CvPLuOK4iMURgMz6NkmoIf31XMUwuC7Z6+k8+IAhcJn/gn4sjLJJu+315ZkKDc2ExsTz6a2uWXkLlZPJSu6LpOkeDh+xedR6+k7P/2ZFLd1CGk7zzrckYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10986.jpnprd01.prod.outlook.com
 (2603:1096:400:3b3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 07:05:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 07:05:27 +0000
Message-ID: <87tt5lrq6h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org,
	shimoda <yoshihiro.shimoda.uh@renesas.com>,
	goda <yusuke.goda.sx@renesas.com>,
	Kurokawa <harunobu.kurokawa.dn@renesas.com>,
	Kihara <takeshi.kihara.df@renesas.com>,
	kazuya.mizuguchi.ks@renesas.com,
	takamitsu.honda.pv@renesas.com
Subject: Re: Question about UIO vs DT
In-Reply-To: <2025051649-commode-brussels-1034@gregkh>
References: <87o6vutrbw.wl-kuninori.morimoto.gx@renesas.com>
	<2025051549-flannels-lively-a46d@gregkh>
	<871pspti1t.wl-kuninori.morimoto.gx@renesas.com>
	<2025051649-commode-brussels-1034@gregkh>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 07:05:27 +0000
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10986:EE_
X-MS-Office365-Filtering-Correlation-Id: f047728e-c234-4b37-08a7-08dd94480969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VK/wvyD4ounHPBNXUf/RIMQ5CFwTNYYiZr6FxJ5TxrvZIWi+Qbec11/C+LdR?=
 =?us-ascii?Q?16L7RR9x/JOGhvt5DBzUjB5ERiDH643zFJwAUv15QdGZ2fi+iDDsbUcTRUjc?=
 =?us-ascii?Q?2Is1XADVRsCleHiB8AuqChBPx29EQwj/cQit6uxtzxZyTFtz1a9azh98lFcZ?=
 =?us-ascii?Q?uq9m6Ipwt54LivVsBxN59ExPyQK1kZK99hfqWR+GjCiCB6eMU2EK41d+G4Tw?=
 =?us-ascii?Q?qZDyX8Z27H4JFrdIW5BZRsnJcieEeLNt54HtipjvvabpOcLNB35sLxH55jhP?=
 =?us-ascii?Q?wQO55AYBlKBEbVqZA4eUptDQGTG/voluBoXKfMgMvRCCXmsKEnRDX/UpO+oj?=
 =?us-ascii?Q?IQXHsPOn3u7+v803bb+Prquf6R32cvv+ECz1PAW/XF3kIr8vtv+hI6FM+V2f?=
 =?us-ascii?Q?4p68cY/WZTPMrCedinemlXGw3nHrrW7iMBGoqm27vHFraxZHjMu7XPjYJm6N?=
 =?us-ascii?Q?8X2AlJCGLxbQgtR0IFPn2cnN1wFyZAkDzck7X2q4IuTedboD3E1Z9CvQkNNb?=
 =?us-ascii?Q?fBisKE03y81euaIv1BXBWQJ8fJTvYAVNl2AiSzguIzcDfCAVaalS9C/Jus9y?=
 =?us-ascii?Q?5lPToRlQrzOp1MJTOXGmD0auzP3hE7TBEK/fgUYmsPQrlejlDMMgeAZSCR/W?=
 =?us-ascii?Q?6HkTHyOKAF7Eso1074k9JCbcXLjQl+OYjZZNwD9YAlbbk9AVwgbwclH2cRG2?=
 =?us-ascii?Q?S1yTCwqBbZXLL197a4roLQfOYt/anA1o4faowxeaJcdy5Jh4ZkIckCMuIoj/?=
 =?us-ascii?Q?jwQWsEAqupxVEqhzwtTtOl8FHz6+FU17CoklBar6lXXbgfE7SrNPMAXDrH6U?=
 =?us-ascii?Q?Acw42X+jVD3zzb+dvl9KIl8wged1aw4IkrOm4xWZOEIzNkUUMnGQ2UBMHHAs?=
 =?us-ascii?Q?K9mt/Pt1lKh54FaxXSJeuCxT1lM4Nvh1ybqSe9SljwhmRWn/CXB2aW5bTao1?=
 =?us-ascii?Q?TQsR6cJtTQEE8bMvjpMMxCJvzZy70qnsOzP3EaizyVTo0VwKhvA05uCowdxU?=
 =?us-ascii?Q?bI4S12LYUZ22qB5TKvxYkT91a17WW4mh6hniEbpBI3RfSuUkBTyprtSeUkm9?=
 =?us-ascii?Q?icXncirTYb1xyIEYfpHxEes4rRsX+sEiuVEYLWNsOL4nHXO5gLfRuosF9mIA?=
 =?us-ascii?Q?31JqtnM/jOE//711HoJnrpqLLVGpGiusfj4RSE+v/I2xMvkGEcDrxhi/XzaV?=
 =?us-ascii?Q?aZx5tB1uf+9byCaYr5YleQw2Tzkz5GDHMgrXI044/DdHkow93PtbO7d+pPSV?=
 =?us-ascii?Q?TQTSO7ZSZCeo6oxSe32UYNiCsTEbs+bXKoivddj/Tn6CK5S815dXPp6EJIus?=
 =?us-ascii?Q?qvBtLYieErG7Fe0Z+9o/ev6zKxomQV6kIVzZevdZT9tljheEBBFPk3AUlkaN?=
 =?us-ascii?Q?IaVo7OBMeDBeQ4PAN6FXK+kTaU9b01eL6b4tcCED++Lf6X33vqipUGs98aEZ?=
 =?us-ascii?Q?6ZfwnKTFfdywbD4ncQYO/c05IObO5NeP4TwIAQGCakDnMMPkKiJ5HA7xAeW2?=
 =?us-ascii?Q?l9AU31KHwjebwZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cjIsv3noF20E4L9SkagW+/ma3EPWhWfJ5E8NCaQN6Tmb+f4cau+XBF8Rlff/?=
 =?us-ascii?Q?Dj7sP53WOOkRpkh7qQ/RWi1gGdipGj47kfS2Obi/N6PuOa0hySgBzlTAAzXA?=
 =?us-ascii?Q?zMpeaG8Z3Ty/ReWYUJoB0+t66JpVUI7IAdMgpbeHdk3KSPMvlNe0J10VHYSP?=
 =?us-ascii?Q?t8m/+o/OIeYzeI6m1cZfTA0EzoQUcPM+o4joiRcEGizarpAgW3uFidMirusO?=
 =?us-ascii?Q?HP1agBIvmQT5WrVIRcx5BMQkPBUadSoJT+9IT0r26W2XkmqAbhIjZbHQXgHO?=
 =?us-ascii?Q?i9v/6ZH442ows4hq1QUtMZBEo7/8ShWyR8D/7oBJgwB4Qv6/JioFEcUdj3Zm?=
 =?us-ascii?Q?v4z7pqJQnwBP6KMNk5XL8LU+Sjfgzt8j7CEAHs2BnkNMvwghh1r7FEaDF3Sx?=
 =?us-ascii?Q?RazZ0wwVDh0b0lNXhFRz1T8A0cwR+pvc1zzAzTKJonW+tnEFioxUxO+j1Qg8?=
 =?us-ascii?Q?U2uHAzc+u0pDTtbD5jJ1VC1cztg6kpvcgb9a8Rn5CiRb0bpIU6WoL5jAdR/o?=
 =?us-ascii?Q?nrsLLmtlPNP8D3rBHUQ+x2WDa5xvD35ZdE9ARjeBw4gU9R5PvH+YIfor6Pz6?=
 =?us-ascii?Q?YTMOO63R7hPXgDTeJSkRPPzDE451E6VISMsMtBpniuq7aimGg1OuGAsoDVyK?=
 =?us-ascii?Q?kz80UtC0ucJ7SchPYbcPafZAbBI6D5VqR1jfarFQ+4ntEAAXSPFRa5f/4oOM?=
 =?us-ascii?Q?orvmj10fXAsn1tpdtZ4xQEffWcH62fGF5MYuh3sLSRaSThPqjr6uCNwrWSG/?=
 =?us-ascii?Q?avxgWMu5aV38DwpAskyxjC+cg1DdmQdgSpSzMTVzkaAuhv+itHLBLJtuQiMc?=
 =?us-ascii?Q?a/gPdmiFXzfzls7GEN/R3TbXpj2ZG1scpNb7ISfTbM0WL49478HfZMdC8ZpH?=
 =?us-ascii?Q?+31a8nEmdcB4vI4lqjMa8Zlv8/GpZ/0hLE4NErrUGnfRPxKcjahuVNX9ZUtT?=
 =?us-ascii?Q?ykLuc54CAD75qlsHSyoKG9QVvWFj3pIxe9Gnfnirb1hQpHK/J/c1EqSGT8Xc?=
 =?us-ascii?Q?7VKUPzVywX/kxcpaPH+VQHGCb+2qLRD2qV0V6yvwBJMdpkrueBgrHS/3PaAl?=
 =?us-ascii?Q?J0ERJdJVBWRvhn5KYKZeqaMADKUMOJXvTgL0VKRkrATIJ63RTA5ujhfaGgsR?=
 =?us-ascii?Q?xChMHgU8VLfnxJkgeV5mRaj2APZHfG4+dnRb8S5YTgxgAaAV5Dgp18vAHPvM?=
 =?us-ascii?Q?mFnIWMjvrW2nojb7o52nOqtQOUoruqhl+1FXonjqWderQR6w7yW1zIipUVUh?=
 =?us-ascii?Q?WXTtpHBkjujWH64UZLKMG/2LvYXsA7jP8eaRxs7c4O4rZpy0cLZafDKSYuH6?=
 =?us-ascii?Q?/5k+9IFNmQXtmMZ3kNpMrriMhM6mP+PBr7ZWj+T53s1h6x8fpLhNQIfzDHil?=
 =?us-ascii?Q?egEE1qFYMyCkLyUW+vHZI2jSMrSvGkbZV4APCBpR5aUQylg3Yk7AX0EauISF?=
 =?us-ascii?Q?8VSGXXROq2uftXpKHh0CD1jqVKHaXtmp/6D9pT6KIz2K6qwYSmXrvS4SmxPv?=
 =?us-ascii?Q?NTI/NHnDtP7jqbwotMra/RNDig+Kq0V7x5D1sMHlPsXSQJwndJNLMss0Yd/A?=
 =?us-ascii?Q?neGVmGhnee5OBFJoy5HyPvUY8w7HtmGs/spJlLFlsxaj5G1Tk8HzUQl0wGtT?=
 =?us-ascii?Q?RJNqXujb2JHMo0uyAZ1c7n0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f047728e-c234-4b37-08a7-08dd94480969
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:05:27.4587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpGBFzDFsc0vcQUR428eGZFqXVeH6NI3kYeAXmOvaIrMwrVwa6eGzTKhLq/s6f9hMPyRAZ1GxzSrS+P6oEMPROtymgHmn75VjEniqYMCCr6K+r+XHpc5YZHSxiExK+FC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10986


Hi Greg

Thank you for your help

> > > > (A)	[1 reg, 1 IRQ] UIO
> > > > (B)	[1 reg, 1 IRQ] UIO
> > > > (C)	[0 reg, 1 IRQ] UIO
> > > > 
> > > > and (C) will be DT error. Is this known issue ? Do we have better solution ?
> > > 
> > > Yes, write a real driver for the device as obviously it is a complex one
> > > and UIO shouldn't be used for it :)
> > > 
> > > What type of device is this that requires this type of hardware control
> > > and why do you feel that UIO is the proper solution?
> > 
> > One of big reason is license.
> > Because it needs to be proprietary licensed driver, we can't create
> > real driver.
> 
> That is not a valid reason at all, sorry.  So much so that I, and many
> others, have argued that you can not have UIO drivers in userspace that
> are NOT also released under the GPLv2.
> 
> Go work with your lawyers please, there's nothing I can now do to help
> you out with this due to the expectation that you are attempting to
> evade the license requirements here.

OK, Thank you for clearing details and helping us.
I will forward this info to the relatead members.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
