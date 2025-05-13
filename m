Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573101F1927
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165225; cv=fail; b=NhdT7rnhG7DBEu4hUCGh0ILzDuwPKBSEgVo3jrzrPCxhmbcAQY7hhX1xlVF+v4SGX06mQY8muUE5WNVtFKAt8X1IQ658w5Vg2NHCrjiHmHrBAmWn+n3F442N99V7iLN7jOFEyumrfAmnmXsuiaqDDfdsCOvnHE7hiT2RJvlqYnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165225; c=relaxed/simple;
	bh=LE26HXd4/PSNconWvtkGNMnBYoCZGt+bGCpFqp9Y5nc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HT0DcVqNsTqOSqqRpDMfviCqrJE28JRT3Gktv0CzxmKZnghRwSwCAqius4cJ3Os2c9G1idAEdSqbAkMiMHweqKuFZFqdqym9LqP2b1x8IHY8EpnljElI9lWfnyh7H1MjkxAj4WPijYiiuOzxDa/7N6l4PbA/E6ZMv3NS9wlVbuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uZ4+7ck4; arc=fail smtp.client-ip=40.107.101.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uZ4+7ck4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUXY1RPYZN95ehLvPDlmz6PhpQo8yD41xs7FTyW794BsklEw9PGkq6p9f1sOUk+CaSn8OihWGBZ9JAgd8aDTZGEsY089FKww3o2lwHBms9wFLNt2ASN3EvcHpWCLmv8O0aLgmlHH3FNlxuE0NgCE8lPZGUi9GPAIXKxXY2nhUWAKZgjbvw3iCmzgHAn6Enwx2m4fxPKGVgJOCUcUUVnn+XwRNq/LQmSWtG8zgcU4SdQKDF/kDcsqx35KVvN5j6HAWyh8uQvsqFGOe2Kp1Fh8JkVTeqTHx5KhvlgenFsiFNs93PO1XKaZgPDh7ni3GXODAiHgC2MSW0VuqTO6n3wLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VII3tLrG8hAr6vJ2zo67bPiN/QgvsCyJgMOTH/Fqnno=;
 b=DT75lnm0BI9/u2GfrjMWjfrdmpg/fGX5zMkk1tyXt+/AsDrI78MYyAda8ZGEDw40L29HGhLBppnSe5SxFA2BRkMsmCDH1B085g1lsGzGqPXj6t9PB+Aukj2+2az3Df94qnmxAw1xs8H44l8ACQLvIxnEikNZKFiD2pA0z+wk+p41zbmU9gdZCYZc5BzitfxxQF5p1K5j+VolYeHWDnEKG6XS4ol5+iCWsNNFklsLu3T/eHUsdJhUkNcprSrV+ccl86IPnVefWDk7fkl/iyP1Gg4efsKjF9r7guDeDRZIbyO5m33FBSqg1QQt5ragdWoTDRCW8eqxZJSH/Jlwn51Onw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VII3tLrG8hAr6vJ2zo67bPiN/QgvsCyJgMOTH/Fqnno=;
 b=uZ4+7ck4gJLkEAwMqD2g1S3mLaMd414tsZDfRuGZxk2ZTB6tmCwRx9QDGENnCdC/RgT5gEBWF4LjOXHETIZQMDOf8rv5uUZdZxopykJbYbIC0zslYKKh9OIqri/DJj1/oEs+KwkW9IAnC1Ov5x4IywIuSeCP+/2mkoVwQiN8Ly8=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 19:40:21 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 19:40:21 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@kernel.org>
CC: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Borislav
 Petkov (AMD)" <bp@alien8.de>
Subject: RE: [PATCH] x86/bugs: Fix SRSO reporting on Zen1/2 with SMT disabled
Thread-Topic: [PATCH] x86/bugs: Fix SRSO reporting on Zen1/2 with SMT disabled
Thread-Index: AQHbw/bCMR5PHx+tLkO63T1N4ciYLbPQ9Ceg
Date: Tue, 13 May 2025 19:40:20 +0000
Message-ID:
 <LV3PR12MB9265545A37DE691E9030675A9496A@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250513110405.15872-1-bp@kernel.org>
In-Reply-To: <20250513110405.15872-1-bp@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=147ea13c-8811-4c61-97af-4cd3787da1da;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-13T19:34:28Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|MN2PR12MB4048:EE_
x-ms-office365-filtering-correlation-id: f2e61d41-b24f-4116-adc1-08dd9255ff63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?F8sc04i78ln3YYMeptI9cg+o7BZtSzIRRXgaITO88DmShi9YecBjo3QjgU1u?=
 =?us-ascii?Q?TXQAFouRLH70JndOTR/UF/+knYXmarPeLgExR7wlw0Ta6psNz+WvTz+SeBmN?=
 =?us-ascii?Q?xQaHM7H7b/zj7ILZN+tQ0ngHkLKXB5GlDAdtEU40RhOSHpqJDcTXn215VvL+?=
 =?us-ascii?Q?M+Nunw9cSgA2E4rWzakspcwqEnROTyyZymfRxnsbteqO+k/sW0p9lycZxfpA?=
 =?us-ascii?Q?oS1+RBwduOKZMn48uMEhApRJe8Kv1JpxoebG2WB6Qc/NAlUY5AQPrhkVJ67M?=
 =?us-ascii?Q?YycwdEib4JNXtNnDwCJ5Lhx8U9NFzDwarX1fPiFGbdHO3fI8zCF0Ke3f25wK?=
 =?us-ascii?Q?8smkK8/JZC2o6OlI1MBG3vTpanNXlR4esQ+obL00sLnrL7/qC3UOgmzVpA5d?=
 =?us-ascii?Q?0qQ3mQS8JJEPGHlxpyAuZ0uYcdOZBN/p/zqLWcrDUctWEpqxfo64L8EM8HsL?=
 =?us-ascii?Q?2/g8WlIbxE8ij+M+5v/e9iZ/XU6CycBDhUTVyadaUXgMFGZ4H16lwOOJC1Ti?=
 =?us-ascii?Q?rXkzMMARQsrs7qATFHMPzm2yivjr6RjdMzA0Bhir5/xUPynp0Xsj+WXB6Yb0?=
 =?us-ascii?Q?qjd5iGlnrK5SehKjERdazP+/ZzAnC/Yigche6hMrVJqsgpyjpwYYvUF/hV5T?=
 =?us-ascii?Q?1GhNF/xXmL4hPNbKHY0xY8/J7/wLRDmgcdJVMTUV68/FrUXphSh4/mEPLWQ7?=
 =?us-ascii?Q?6c1aVvYZkx7uOrB+/OS7NXXOcwEiaD3MeXlMqhc5ULs+JbC8Q7AmQmuCWLqs?=
 =?us-ascii?Q?gNYnUDvSj/rfufNJvnL9pvhy21fl5fRmYUYblEJ7mZEtk4+WBwsBjWGozpNz?=
 =?us-ascii?Q?J40TMHEdtIxN21ouQ8tPHKBGlWGE6MtA9qm/8FmrWtKXD+P5VvtELsv0uHhE?=
 =?us-ascii?Q?jex4z5kt1r6M3SJberr8r7sr856XM+w+lE9qEXAO/YUcaSNbUEzgpjpIYwqI?=
 =?us-ascii?Q?Jl1l7guykE9IIQo9X8oLZpcgQaywQApW4eiGzFxcsRZAhIhqyQ4GquUkDr1t?=
 =?us-ascii?Q?Ti8Uz++rB4SdbRcUr64iQM7lq/biwWyYDm7ll7ooOt6r1rlFC12GHK0tT/AK?=
 =?us-ascii?Q?M5yxV6O1leiTk/NfaU1EAkHDwqlPZmW5HF/Tqi2PvQFVn4RJhTrku6BCz6Ly?=
 =?us-ascii?Q?4yc+/t+6+X/AkLT4Zk8D6CEa4ICY7h5tUNb6N39jjFDhPSDFZJm6Zed+BitP?=
 =?us-ascii?Q?iVH5LfCV8K+BPnWAEXvdwsN/SJJ++GDPr+pjauUQG3KN+f/h3mlD93zRS+OO?=
 =?us-ascii?Q?h9iPS9OMPJtBMFD+ixa1pW6P9gfdmKIabxmhsYwdGhm9Bffrq8drDmLdlfCb?=
 =?us-ascii?Q?pYIIux62PLB3MLI0wmVsndbWFo80KbwVNpfXWzkNaRZOm4RkPZqzbK3jl7HJ?=
 =?us-ascii?Q?Wet4xM0rrRbJQj7z2yD0vU0Ct4g9XnDoXllNfvmDSdmRPcUBrIvW5kmLJ31V?=
 =?us-ascii?Q?6+yeGXJv5/RSePrG2CDWhOtCqr05XM4rM53g2I0SjU6946f6hp2ngw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7qCh3ZV4RwCUMCK9xek5bMJCPyLBsCovBegGmR5i7i1bodMOmOWjOGYmrcsR?=
 =?us-ascii?Q?SlNSg16a8jn1WlqCpBHq/YiADasVPd7F8To6cR/DXdnXWfSWPu6+EDw1CR3/?=
 =?us-ascii?Q?PiX7EUCdCAGs32B9m8KJKIUx+jSJrg/oSUWR/imPQLK64x8IjTJWTF6PAMUd?=
 =?us-ascii?Q?u1phyMGzt736nHmgpnSCSZoGoF4/FRq0K304+slZNifuYu+cnaqvuBUGsvkQ?=
 =?us-ascii?Q?Ftfgziiu9yvjCCNFO6bbYLvkUinzSbIP1v3vpxue0jqm43m7iL1A4WPMQJg4?=
 =?us-ascii?Q?WLrUBBtxcq5qxpKZv+U0H5g+NK0Nvxg2jylxyGaPrm5BGHfGjcE5QHFkSFwg?=
 =?us-ascii?Q?2pk7kl0Z6ZeEe5DCIZxGPFPs9jkFGlMz0ZRXeuq/yTuFSiHbk7LTiKa744f1?=
 =?us-ascii?Q?U4EYghq30ZmN/PVMdDWtGwy10FljaQPjt2RGSRG1mMYJG5QemfheAHzAmVlX?=
 =?us-ascii?Q?eT4Kr5NLgs645ozJgErfz0hq7BMrlGqT/1nRFGcxToYoCgiu7DgiMc8Cd2O5?=
 =?us-ascii?Q?VHqe9ekBlUKfOfEnI0QU5aahtmLuM2rOd5WztXKHYsS/3SBtqAegY2G44I9A?=
 =?us-ascii?Q?sED3dgNxXXieuj0oqOWHvZbdBYyAT3IW7RPMHntsUOgRqttkMadDQf/RvwA6?=
 =?us-ascii?Q?H2nptWkTL9OjTJTXYYCmKcx+GhuwpXuZxks099dIAgaeVFMaR7F6/ItmkdUI?=
 =?us-ascii?Q?ZNQ3RkApvFbtwwRyCv4cqVZpON08fyG5o4EdkUKJz84KHCrUYOucTdhVpkt1?=
 =?us-ascii?Q?E1vgGFRvC4AXmA7Qt/14UAYn37i6aU/DHJF+wNqM8lqLlzK754OYeqMG8qsf?=
 =?us-ascii?Q?1BZsNpUIJtqTOrDnDSHw4P3j8Tucl4JgP3n5W0Q/Ds4alBwJbAoMkWNKL3we?=
 =?us-ascii?Q?SwxU8iNB9ZuBR2Lu2n4GAf6Z2hUBjats4qgurk3qLwAmSb5g95RUX6LGpAGT?=
 =?us-ascii?Q?OFQCZUp/F1cpb8KRtzDJz2B7bW4CNNMeAQ5g/mwlH7WPDNiOQRrXA00+/zU+?=
 =?us-ascii?Q?pub/FZoXSf/GEXSS/6qHIPrcks0N7taA3XpdixcGULz3BBhD1sXRRfzZgXMD?=
 =?us-ascii?Q?j2CHIfZZqaBqXedgBcAVJjmUgHA5rTeAGSuJt3Af6NtNaeqtrDNlXrYvxDSA?=
 =?us-ascii?Q?V7iwDJKVm/aOhO5ew48rA6NigEhGsp2Da1aqx7+TAethREY/lMdGgZj5M2Mk?=
 =?us-ascii?Q?wCWE+Xb2a01Pic7Sn1+dCow+qhjmLOOQ0QMkecPNUwSzfZf/RgXJMEzN17Iq?=
 =?us-ascii?Q?wUj/7qDEfsX/iAAdDuBl6ftNMwQnUcFE2or5nduqWk3vzHWUGEh5YZHwGpqv?=
 =?us-ascii?Q?AU7e9Y6JsExetpt33e35AGYHM6s6cBtjqgjk4jkx1SSmnLu44VdhGgR3jODv?=
 =?us-ascii?Q?sKkgBvmRJCXC7onZAf3wMmfY2J0g1aiF+gGzGWgzQzyiIZoErwtO6iiu6OiE?=
 =?us-ascii?Q?uFlmDKv28a1/FUn4fzy6fC0I3cpMtuVULaSfTHA+7OOZ7oOBz3pddGt4vpam?=
 =?us-ascii?Q?DDQIp3E08RcD55GPGTHEldACLOCmF5opkyHf9Ytj38wudwy7BCraKi9dmu+N?=
 =?us-ascii?Q?C9l3WAM+eAd11KTsV38=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e61d41-b24f-4116-adc1-08dd9255ff63
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 19:40:21.0503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXW+hhLBph9ym6Dj/DI8WnpTxrv6EjgWJPNGOm9oOB5RwRDo1Er26uh8j8yTdVbc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Borislav Petkov <bp@kernel.org>
> Sent: Tuesday, May 13, 2025 6:04 AM
> To: Kaplan, David <David.Kaplan@amd.com>
> Cc: X86 ML <x86@kernel.org>; LKML <linux-kernel@vger.kernel.org>; Borisla=
v
> Petkov (AMD) <bp@alien8.de>
> Subject: [PATCH] x86/bugs: Fix SRSO reporting on Zen1/2 with SMT disabled
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>
> 1f4bb068b498 ("x86/bugs: Restructure SRSO mitigation") does this:
>
>   if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
>           setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>           srso_mitigation =3D SRSO_MITIGATION_NONE;
>           return;
>   }
>
> and, in particular, sets srso_mitigation to NONE. This leads to reporting
>
>   Speculative Return Stack Overflow: Vulnerable
>
> on Zen2 machines.
>
> There's a far bigger confusion with what SRSO_NO means and how it is used=
 in the
> code but this will be a matter of future fixes and restructuring to how t=
he SRSO
> mitigation gets determined.
>
> Fix the reporting issue for now.
>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Cc: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c inde=
x
> 47c74c4ae206..dd8b50b4ceaa 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -2942,7 +2942,9 @@ static void __init srso_update_mitigation(void)
>             boot_cpu_has(X86_FEATURE_IBPB_BRTYPE))
>                 srso_mitigation =3D SRSO_MITIGATION_IBPB;
>
> -       if (boot_cpu_has_bug(X86_BUG_SRSO) && !cpu_mitigations_off())
> +       if (boot_cpu_has_bug(X86_BUG_SRSO) &&
> +           !cpu_mitigations_off() &&
> +           !boot_cpu_has(X86_FEATURE_SRSO_NO))
>                 pr_info("%s\n", srso_strings[srso_mitigation]);  }
>
> --
> 2.43.0

LGTM.

Reviewed-by: David Kaplan <david.kaplan@amd.com>

--David Kaplan
