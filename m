Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8D021FF20
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746277849; cv=fail; b=mSQQw5cnuUekYlFocQYS2lmSUq/MXR9lzvwxtQ3BrkJJNVFKFNZog7p4pkuhj/971KWaswwFpINl9oDKDKPcQ9U/JaR9+k0CLCH6Wb8QsdNjZ1RgTTqSozfAbRB6slnkJ2SwISGXrEOFnigyaMHHDsgEGZg9/B4ZckxOTBBPKuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746277849; c=relaxed/simple;
	bh=htWP8opAkOOMh81ILYM4L4uID58hBcqLYOOJ9v28CZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sisho9IXHju9aCRUD7EfTniz8BuPdSK7ziHG+h2kHJCFUucA8RooB6BTCk4Sd6Qd6tiWasM9gMqudcTvb3VQOSgph1OMOUBjDzjYDt4Th3KWRpnbt8Y/5aOD9ThhWGeDwuClFr9UHnNZXL5Fr76x17BYHg080AaeXiSnSOAMOeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XQQd+ikI; arc=fail smtp.client-ip=40.107.96.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XQQd+ikI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGkBqTgFvdC3MWauHGPa6BBuiCBN+AXVOMLfRnJU3+go+aSB0I8JWXpM1pfAz6XjeDH2Facz2Kw0S24FjP6mHCAOTZs6usuBPhAiMp/BmcG6eg/3yemE05iGcI1OYzC8JDRWr2iMxqgpc3hwjWk+T+rBUAAJYI5y/DWdvSCo9LC2r3mV/jhrGP2yJ+rFBRTBq3AF5dr/ufF1lLiBNxtF4L0Vg8H+w+WF0Xev/igFPCMbpshBZrkoMohq5mYr/8HK/9PdWS1jJ77HOpwF9CQ6Elk1/ml6qP5tpzJ7CzSEuSJf/R5SSCOw8zjVTOM6zNVgFT79FBbxKnAAobC8vcrY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzW5QyLiR2R0EP4d78mOB8J0D+r9JE96K+HNbZt21PM=;
 b=lL+YyweGilc4p/7PBxzS9ERfU39VGAwFcqFkYXmBFcnhfBpNuSq6FvzA7CUj+LINcznugYj2vSdNXhLMjS2WAEb2pUasb2N8npli3WMuDiiu6oGWs1PoaQW8xiR+FiZ9OLgxZqPdD8bzXbFIuSUliRphKaA7N8Mpn+MlElLUijHSAx/WtpLm5P+E7xVAZX/zxSUOpQqfrD3Aavn8qYjQdY0tjeQgtIh+G7qxk34T4IKwfHnOLJrbEtE0kHgncm/nh99Y70007VEB658vUp91qg27ACrlpqASdRnHyZb4eMSmilL6uhnf8J32kkv8tvtaSEFxO9f0Cv+hWV+KJ/2Lqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzW5QyLiR2R0EP4d78mOB8J0D+r9JE96K+HNbZt21PM=;
 b=XQQd+ikIU2XvRINjbg9opFxV9rtw4JvLYhBrP0J1tluIGSPJrwFEI35/KXgAVn7i/FsOIt+2msMGgt7eQL3Lledwktz/W2fo7vo8vw2ptTpgCUDNfz/adPFonK3ccWexQJijNswYJsS0r7t12bGmcyHaJelxEgxEhktiURXekzoJXndCUdbCb/x3Z9e3jWXTNVerr+9teK0j2kKEaOTt/v48rObbrP9wRD+gwnaEl6O6JAPuZeSGK+8w87U1B7LZxLbEqqXbPsOiurHi5aBfgdENmOlSk3Oia9J0BVgvJqgZI69gYcXDmbRUX/BIVnFoLe2fa9OyoWslxaHTsyfxVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Sat, 3 May 2025 13:10:45 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 13:10:45 +0000
From: Zi Yan <ziy@nvidia.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drivers/base : Rename
 register_memory_blocks_under_node() and remove context argument
Date: Sat, 03 May 2025 09:10:44 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <60B9F7F1-42CF-402D-ADC0-4841946D5AB3@nvidia.com>
In-Reply-To: <9e9fe4715c729e54e3820de0f24c185a26679e72.1746250339.git.donettom@linux.ibm.com>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <9e9fe4715c729e54e3820de0f24c185a26679e72.1746250339.git.donettom@linux.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:408:fb::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 09404026-a27c-4f55-54f6-08dd8a43ea3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nlX+yktP3f0Hu8Z+CchVWkxVPCQ3os40Oo3D57GuT6lsiLhCxAgr+QqbITCt?=
 =?us-ascii?Q?IfDb/InB9BQGpyxO/cTSq5Lr0Z7cw9FkWTWBUpT7PpusL65VBY1Y0620JY2K?=
 =?us-ascii?Q?HAeKpPUr0qlsmBGuIEgV/wfDEzxI6zKFdIDYfJdHQ/FqcyAOauWENUty025a?=
 =?us-ascii?Q?83Af60QLti8pUw6D5no/rzvCrNN3fvjRYSELkoA+B48Nt73R/WDN1kaVnHEc?=
 =?us-ascii?Q?U3NIHOJG9gAevjyWs1M6qDAbzBMJTBIMfPRgiIvgXforg1TaOUeaRghLNR8h?=
 =?us-ascii?Q?h+s2/K4irt0LnZHq0m5pPhH+DnsB1SoAIx1a0+Fat7267lHYV6IUEz0yrZr8?=
 =?us-ascii?Q?f7JnrLLB9baOX79Fp+47iFY2wbRjFd7C+DgFVDofwHNiDWUNsZfVcKuqZ1Je?=
 =?us-ascii?Q?nR924BB0l4yUs+XKT3T83Bi7b10SqgziDZuOJJ+nr6MZF5mZoSc6XEMYxkaz?=
 =?us-ascii?Q?kFRKCtzrvKn2nI/phriGETY//MY7IkQNVMtjvA2crBVfSvxAp3Wh8mBonOiQ?=
 =?us-ascii?Q?JFJmdn156FVHXlyaj1baXGqxh4NrY1N5ek5eG+MBRAZeCsOAy17YtVqrQRt1?=
 =?us-ascii?Q?gaYfVVN8exwPdX1nYM878ZDMTtQWA0Bifp18PpVC8H1KYHrqwr7t31EnaMlq?=
 =?us-ascii?Q?UK6+a1o+C5RRPlC7inxflDmN/i3Nhipfu7JVTDPLUsY8apCSOWTdogbAU7vg?=
 =?us-ascii?Q?/QtgK8iazyH4Wj9k2RXlEMzttlh7IcZLwWFySi+4iraOBEGxXlXQK+LK+9gw?=
 =?us-ascii?Q?LrtF1FlPSYeYM8cD/3U0lnjzp7TC6LPqYWyAiSTe0VphAAQRKZvFOzq7O8+J?=
 =?us-ascii?Q?PSwDwY5ry1PqEBsi3816re6UjPO0/UfYExQmSW8cyJjXd8DAhvEeY+lt6Lom?=
 =?us-ascii?Q?c5fm6Yk4FkrkOERJAzqz/bULPaWwa/ym+jYaGzJoQr7j0kpvZQrOp3tv1el5?=
 =?us-ascii?Q?tASbvELAhcHHOyb1c+vyW02Lh4E/RIkZox3ICKtGTQ65jYdKiG6qMQh1ERaC?=
 =?us-ascii?Q?c1oNGj9f38U9mHjb4Xk77Oo60t9cvQto530Uo6ECO8XEjkvaJQicYdodCPNO?=
 =?us-ascii?Q?5HqK+ZfFDNTaHJnXb6NMaqQGLTGkg01F+zHImKXFujeR/Ag3AuiYSFSAKfWz?=
 =?us-ascii?Q?QWMgJsAUIzsFU+7vCZdoG5UHetBXF4FriI9aSHRHOK1BpIbeIEMpYfQEnrkg?=
 =?us-ascii?Q?JLJ2YZO3WJdJRlD5Zr7U1tvpmNy3uRDZBshQ1n/K47jUipv8twONSuPE+D9a?=
 =?us-ascii?Q?xuwy/Ij1uz6T8TCfaT+fB5reOLSMSDcezcGXidkbmxILBekYOwW3EqSRMGLG?=
 =?us-ascii?Q?O4H2f1B9EMnM9oeCtmloQFag87NeUe1tWK8eJ+oJvrKAGk8ycdRsKGcE6c64?=
 =?us-ascii?Q?sAiedZN4T8zdeCKx3AIgDKUSm9p0RBBa0AD/dJAcw84DKhPy+LAox3QvHJIE?=
 =?us-ascii?Q?fuCVkmHxMhE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TIdxTWCSZHla/406EN7cW1uujm1+xA6l/2oQ/B94SDzI6mSWLzZrkIqdgHLE?=
 =?us-ascii?Q?3SlN/Do9j6xSWmHwDNDdBkljHBQpMVnVriZVyA9OzQstNIYg6Edk1w3LMWUF?=
 =?us-ascii?Q?vYC9o/x9AClPsrJJcin0gjt6onDlgjtinOd13dvq9c+4R5EWEuXzojpnD3om?=
 =?us-ascii?Q?OvOkJfgiOQwQh7ZUsEOaC1CokIQICzu9A+REn+3h0GeO3Ezvbt2M9V3YSPkS?=
 =?us-ascii?Q?ZNtBioC4dBhNlBHT0FO/WK4qJYxfdNIeC7+5daepxyQrtYGZUqUyKwnfEFl3?=
 =?us-ascii?Q?PIt834pTlQ+WSiNqxjvObSh198Xmb/Zp0Ob+yRwim+V+kxmpwvsDtjwZ7aUe?=
 =?us-ascii?Q?EOeWytnRlQG6id+IyD4a2DxLUzzG2k33UyUqmU7SdNAlDxMOKUqXRDrFpUdX?=
 =?us-ascii?Q?qczjgnT11wCK93RWNg+skZw1Kgomxoi6IKR1h74eDsceDq2NPDJjtvG+mM7S?=
 =?us-ascii?Q?iNRVgHXNR3rrg+wnyaR4rPouOCdQZlzH3JVGuaJvil2faMP1MhdlE1H4LdTA?=
 =?us-ascii?Q?j2scr1u5UJSyecb1TvRinfiT6y2852hBbYPUedlDpqJfYkCB7rp/4qkCbvJG?=
 =?us-ascii?Q?6/UXwhXWiWCj88QNR2g+pvH1WeduykC10lc0YOdczXCjHO/odQpLXkN8+zjd?=
 =?us-ascii?Q?dekqSYCaBc/QsEkmRUWB+PxssSp1KkJkGm1RzCavtk6WQiJynREVtFtiL41K?=
 =?us-ascii?Q?sWr8UNOSzqRCNXCmYJP5xh/s+maFUbvvzU3pG67NItXHALw0TUPMXMW48TyS?=
 =?us-ascii?Q?eaJFoj8TnzkU6IOXDQdTBTDSrNqR2L8YaAt9F427LOjxUw5mABgAZsk3eEE5?=
 =?us-ascii?Q?7M7Itn3E9DveLQLZ0kx6Dxzsy3j+8NDjaglFKFhl/oy8IVZ3AsHB48cs8dfh?=
 =?us-ascii?Q?Ldi7PUlFMLq1hgI2vRCR0hiuMa95SP23SLgJtaVOpWMkdId0+4Y7qRPGFuvU?=
 =?us-ascii?Q?jahetnSXhg3NOGK9tKSdrQh083S64pGSYDCI8jt1H7GVsMoaa97EBjhQdpg3?=
 =?us-ascii?Q?i0VrjwnhlDnNQD+s7bm+ilyZc3uQK4hKgfM29DbzbLJgZ0YBUi0G8a2RK8Fb?=
 =?us-ascii?Q?QYvwKZWo+faj+rZrQyyU8h1+yd5v3t1XI8I9+P1/gJFs8wBsMqauHP32bwfC?=
 =?us-ascii?Q?45nPKsmD5VCGOK62cu5TZ4JksTcasmCg1qLbt0w1RVEP6HHx+FrjdBpuxOmd?=
 =?us-ascii?Q?/FEUv0v3fmV69dTynUp/y33A4cfwqhFoqjruiM9c3l648dCYROQIET69/EYV?=
 =?us-ascii?Q?KrP5RT48TEkbtUlp7+Zkd2b+pEHx/pmva+jnIUHvEYNbO9Wp8S6Pysj3b9OT?=
 =?us-ascii?Q?1WCmsviV6btu7NfoIzz1NCWq9NJy3o9HuLPBon4IOndSyuY54k7tp2J8nPTx?=
 =?us-ascii?Q?tuMG36smI+20skEBUj97XUfQ4Agin4Hs2xdNxXiIQTIHo5HSptOyvHF/odjo?=
 =?us-ascii?Q?cswsEbTyRPcUZ0OK3tKGEL3BDQA2/653GaTqvSPzyu+vuE1ysge/1YBk6V6Q?=
 =?us-ascii?Q?PB9sZPSy+tRmnxSUafEKxglTwOkSWvKma+4+zZMHN1EqHfhlplAieF0QfyuE?=
 =?us-ascii?Q?a17byaopJKkqjWgjwqvlVabLEau00Ih/Hz8Y4jMB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09404026-a27c-4f55-54f6-08dd8a43ea3a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 13:10:45.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7mI9AJpb0Z9XXwrSGzWKjGhVLw0BVbUB+66jvp2BdUqtUW82XPT1R+cqO6efgrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

On 3 May 2025, at 1:40, Donet Tom wrote:

> The function register_memory_blocks_under_node() is now only called fro=
m
> the memory hotplug path, as register_memory_blocks_under_node_early()
> handles registration during early boot. Therefore, the context argument=

> used to differentiate between early boot and hotplug is no longer neede=
d
> and was removed.
>
> Since the function is only called from the hotplug path, we renamed
> register_memory_blocks_under_node() to
> register_memory_blocks_under_node_hotplug()
>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>
> ---
>
> v2->v3
>
> Removed context argument from register_memory_blocks_under_node()
> Renamed  register_memory_blocks_under_node() to
> register_memory_blocks_under_node_hotplug()
>
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5a=
c7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09=
df.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/node.c  |  5 ++---
>  include/linux/node.h | 11 +++++------
>  mm/memory_hotplug.c  |  5 ++---
>  3 files changed, 9 insertions(+), 12 deletions(-)
>

LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
