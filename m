Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE91156237
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407995; cv=fail; b=JR4Hgore96CHWGp2Ti8L8wY1fIkVghDUkExLdEdHSGhO3r14e8pBCaMefkrcmT3LHm6EPWWATV9ideaS5D/z30NnUaT5QY/ySqPTNNe+HxA1e0szEULZUQZu0DZOMdKRoYwxomwA1i1YhgtOPM+d3hW2oe7PFbUFOPBHIVRzPK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407995; c=relaxed/simple;
	bh=jU96ftgpRMdCnnnzeFUj5cNWP5wDKi9+DSHNYg4TDH8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y94KQAu9Wk9S4X3txwlTAKpREhlYVyH/eIy4XE6/1VVdMe2Y7rgrq8GkTf6TWelqWqF6gQUCKBn3A77MicoRLCIKgQrcVwNTQusrFAFgWEzPCueK6jk0tpiiviRHJrum+m48uiRHgwQClE9F7SbEz+AwlAm+Hu2fWHkN38xJeUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gTITwsXI; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gTITwsXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiVEJaKMGBQwIUn0/dNvm50n0iHdPZuReYWWEXAhnrAN+m+uUgS5ktO42eb770/YTIg9B9ygHBVUJclMMAVq83SiIVC85GJMNsErXvrM8/xdkmEej3+hFv5WJAVavVlkgdGGuA/LBKSTSfqpiiW0HxA3pDPrR7gx8BZWLIAD9K0qw5bLb7AK/apkBLUMmERL9RxUA6aEF2uw0MbDot4TucdSRwDKhFtl1aO6C2vjQ33sZsGnIyPerX238ccw77LX9c15cvLcf76mj5UJBVWpFV53Jr0r4IThqZBQCRYfrLwsPfz2IZzarU9lfaLEJcD2ipmIqCB16XuYJGHO5rEadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf1gTb6Qog9W4BoaWTvt0Oj5FvmtzGu/L/P2sGqDmbQ=;
 b=pPLCYqYth+hALewUo7sMx0rsrNl74tI+Mh+OmGPhPe9VHuqbPnXFyhFrOM+ugdoaHsYZxzI1ziDPg+pSmHP1fuESqtinkpS7P2X6ADN04sAHTk6T+/RyEdoyhCZcFsmEZ/knXjjkjqWab9JzwK4X4mcRAcXn02oYBixkqk2Pp2UumhwAxo3RnVE9YK+ChXD/I7Nh0xQs2CizlUEhDdqSbRG+EKLFjWD1ZxtSk8gDEaKE2VDUdQ3u1sVjG/RdgDbrYPpUBLgsrdd6tTjMyQ9uMkkQ3EICoXlUvCecxD37tMP6NbXDw/csvsIdh+UHs2hazMMpSpBSnpsGK275dhs44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf1gTb6Qog9W4BoaWTvt0Oj5FvmtzGu/L/P2sGqDmbQ=;
 b=gTITwsXI+d5T7HPkcIlaBcrbzi2MH/ZzZUpwdfs5PU0DXia5BjflpZ43Jf08SsHrA1ZCv9LAKzgDyhzDJ2Ty5CkAHfj3Z84DQJw6pCs8ICSBlUdDzLGFB7F/oJIUF3chZJhXtnX4TGbmKYtrhzmj53BQzfNKeExRuaXtnIhGcxs=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 15:06:27 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:06:27 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] x86/bugs: Restructure ITS mitigation
Thread-Topic: [PATCH] x86/bugs: Restructure ITS mitigation
Thread-Index: AQHbxfRfDF9rB1p9Bkyl6Afc/NsLxrPVVw4w
Date: Fri, 16 May 2025 15:06:26 +0000
Message-ID:
 <LV3PR12MB92653811577802E84DEB6ACE9493A@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250515235210.ooq7ogymcdvbtakd@desk>
In-Reply-To: <20250515235210.ooq7ogymcdvbtakd@desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=53fafb70-f23b-4cad-ad4f-2e10e74c2263;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-16T14:47:44Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|MN0PR12MB6152:EE_
x-ms-office365-filtering-correlation-id: e7dc0f01-eef1-4501-cd06-08dd948b3b23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rewbFpGEdjPUXFrVOBq/Shqdem6kNe1SU/RypzGPuvXRXJoPBcCLiekF+9Pd?=
 =?us-ascii?Q?lC/tLpwsbIYkzpiSdoEQA+bg1Y+ywDOTzQGrBpl+Q4iVP/wP2ej5uCOgRoUx?=
 =?us-ascii?Q?05YxlJvFsdO+hvsdBAEKYHX6fF6DhBOLYeXpJs7Y+zrQYENNWsBZOLREZqoS?=
 =?us-ascii?Q?raI9ygNUoh7yjoI+5xwhtWqgSeLw7+D5ulyDjTUR2SFZCuMx6i7GVVR2i9bX?=
 =?us-ascii?Q?zviXfpo/93npkaMsMMSbbTZ3mC1xxCuCys2kbGAL5zf91Snsu8CyEext+ok7?=
 =?us-ascii?Q?c+eeoq6NeZi+dvpESWu1xRDfeTgHWZKJT0nzBUA9yz0DPBOA5Ac+d35W5mxn?=
 =?us-ascii?Q?BMqM8X+9YXqzhSYzHrWbx5kGsXpi86PsHGc4LCygbICaeVjsncIT5PLhfdzs?=
 =?us-ascii?Q?hVVoPvpbQR1UoYaTISi84hdDGQFSiYul1DIxPMylR1RZ/N5oMmRGQ1SNUJD7?=
 =?us-ascii?Q?NQI6IQhDTaEBNVGn2B6jglxHDi/3JrTkj0HxT+DuxnOHhUHXZhwaYAOafkbJ?=
 =?us-ascii?Q?2XqAnceGDqYR1vYxBND6XRDJ7EihGyhFZwh2wTh+XaP92AI4fgjg6JSI7yZH?=
 =?us-ascii?Q?71OCIJR+gHe7mrkQwPsxemZWA1rE1CyMUkwNlGagvnDbJULJuY55MbRvQswU?=
 =?us-ascii?Q?bNxlU6KrVmcsvH0e/jSMZtWJaZEk0C5W8XjmsbGZHDHeRkj9grESIFJJBm7w?=
 =?us-ascii?Q?4RRL9OjIAVT0PqKOgwKwke6/87S8Wg3bvslImvioQcft/3aVcS/74pKLpDuT?=
 =?us-ascii?Q?XGg+mnW3idwr8yiR/9DW1ZqU5neGUFZYNDeP4L58FiThFDW3eYC3bbb/JwPf?=
 =?us-ascii?Q?iN5b02h8ASVaVFk2hTxo6Isw3KVd+l34C4rfObc1KowSELCxnhLsim8+42UE?=
 =?us-ascii?Q?qvu8tfi5O5f0xq52u/Ft5yJmLyyrRAgYiCSsEaDdTQnLbtZKmiE+Bcy5+gN4?=
 =?us-ascii?Q?9E9qZt2fv48c23PNTbWX/p9ONM2YdnWYGbC+IS8LlMHRXiBu2G1wf86YralK?=
 =?us-ascii?Q?JXbRCuNBpgBMLn//wQzmf0qgvQBcs9p+J2Xoxo1LhWyDxHWy7/gDyY8sKtSV?=
 =?us-ascii?Q?mbYEI3zOcEtbt5c+ygQdKNFray3nWiXeKHMg+2eCQ4Jrftaobnk5hY/M7YVC?=
 =?us-ascii?Q?yvK6i0iJg6AEE5BlVaDuYqvErfsz8oMae6dM93+EQxaLuY0e6g3DeH1ErrPg?=
 =?us-ascii?Q?9cNTa9rJn7sGbsHKGjmnMrBFo4PlF5rVTsBnE5JnFBdpc95QCwRHA4e82Nfh?=
 =?us-ascii?Q?jooUAgnLIWT6XovLgjsDEbdNngT7oAYapaIz0D2yVmuqrzaRx6SSw3QgJjkL?=
 =?us-ascii?Q?JC5yDtPA8wKjJSx7pAckR5Z6rQNktP51qaXcqXIASf//dsn2atmGPtKrDmXm?=
 =?us-ascii?Q?jm6VD8iCHeV0lwkCgyvWHuQRg0SkuyEiurfW+69QeZAS2OjNf/i9glpOpnP1?=
 =?us-ascii?Q?XwN2t4M6kpd7vMiIxiWi6p+iL8OnMfjlgcRjbFwMTKW50118t6vKlk0moPwy?=
 =?us-ascii?Q?RwqHwH3hCD5jK9I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HrfitY5pVRtApgZs1JoGVD4E1toH+GNSpgBkwFzuLZEhQisgUNFkFQALD9RR?=
 =?us-ascii?Q?c8GsQFnL7MGGdoNt3XByctF2r/8wPNBJqivVowizDByRIG4NghNeqV9TjXqb?=
 =?us-ascii?Q?dli5tb6u6oSvHc8Ccws1qaXfeKOcq8CRGRRi5PLmFiL4gERAudbrmytKiv14?=
 =?us-ascii?Q?270bgsnSVPgllSL0EYFe5CuGsNBYHe1RwooHGE9Kw9HzpIsWjNIxrlnhODnm?=
 =?us-ascii?Q?5ESo4YO9vrwXIP790EMzZNnyvkC2GL7XsAe2Bb/UcqeDIcz7RzzMt0UoN//i?=
 =?us-ascii?Q?9Ig2PmncT05c+2zEImEWYYhianKfdGNSHzINyFd1BNSdr1Xzm9UZ+20T2a4V?=
 =?us-ascii?Q?tXS6tMAIowRMn/ENUyfZQlVHfvu9LuoRq427bAPOUC6KbpygWpp/Nuxh9QPd?=
 =?us-ascii?Q?lcpdXemtO/ouN6yB+tcAPRJSsn9NfAZoX/x2NpAe/T0NT6pWGRfJc7gjKvWx?=
 =?us-ascii?Q?oK0+g822RPX1loYjAK+j6jyIkhN8YDzin973qn9P2bL8i6GzWjhXmovi6+6v?=
 =?us-ascii?Q?S8LI9h1zSxt52bgWgso3ZxwRk+FEwuEgqqzuKrtca4bL46u3ZvfWVm0RIbAh?=
 =?us-ascii?Q?wujtEVttIVK7D7dpfSZElaBkEn9q3NSHhtMCUizL24Wvy617Oc+XS+vXP6ZT?=
 =?us-ascii?Q?xfu6TYZ8/8xmisEXfuDvd/cPLhq/KOfG5NHPbn7G8T8yq6BSdH8CbT/y2a7G?=
 =?us-ascii?Q?779BcpzBrcXDW97HR87Pt7jl0SJAaMSPlPdAl81EA0flK5LG+LoFGtiBXatr?=
 =?us-ascii?Q?DQnWIOh6ELPGhgH7dbrr+HLqDzJ/IlvPJx9hpNpq3Wi+1Yput5RTdymvwe1u?=
 =?us-ascii?Q?vCW4aiiUa6cyT1hXOMknMLIFMAkzagXcbHymN6SFsZUxOIU1V875oIvsLlJ9?=
 =?us-ascii?Q?a+aaBN+65vBmGvgsjqROKzDGenGceH0LyaRiHvCOPQN/gSPz87jqokxaa+bh?=
 =?us-ascii?Q?VODDfQjOh7qLnyzGGgGrobR3g6NaKmCyUVukPPBQ8NeEQe5g7VTdt1OxlNvk?=
 =?us-ascii?Q?4PbrbJZyX9Yxkn3EkmKWRLGJHZf3RWurPcU2KKo+/bCiCDAhbeSAwBPKBb0t?=
 =?us-ascii?Q?eXaY2tnESUOUvBxTfxzg1PShQkVjchbkoE1hzvMRlHdLEaVFzh6T/pPAir68?=
 =?us-ascii?Q?pkdipuwPZHjOJeexxk1fcgcmU3sEkj9j2XsoME3nR2cqv1h9dsw4A8boWvdY?=
 =?us-ascii?Q?IXdUa+FmLjdOLWyDi+dll7NQa2/0hSS7Zt4+FAG0rEg4sWI83NQwwqOLqpgu?=
 =?us-ascii?Q?MZ6p6linGYOneSJzmul0sddwF4EUqfjCyY427Jjeup2w8ulRvljxpXMUSv33?=
 =?us-ascii?Q?mE6dh6+zQQt7GWUEDqtQukI/qs3HuOqKR2leklDkquPEX9Ne78k6SCcfWvOk?=
 =?us-ascii?Q?9B1yU5WYkvvLN5VhAkhnlu/mmj9STudYFIvfznRh5cfklDMg6y7Jlp9K+8TN?=
 =?us-ascii?Q?1onpDWYklpR0S1o+vRFaCtNi2/Y85ZMx9mycal8XW4ZFX7cU70Kxywjnzh2v?=
 =?us-ascii?Q?XQcfSRKO7lovDtaxNuSPoEhMaTwmPCWxdexiFa+8UMZXQoKK+iDdTwJn2MuB?=
 =?us-ascii?Q?9DkG/nnlc1qJNP5VYx0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dc0f01-eef1-4501-cd06-08dd948b3b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 15:06:26.9723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1X4VC1Ac93X77MxEoFU4w7vigIcuMFKXfcxfoFwtkCV/dNeHzjnHpFIful2TQQ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Sent: Thursday, May 15, 2025 6:52 PM
> To: Kaplan, David <David.Kaplan@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>;
> Peter Zijlstra <peterz@infradead.org>; Josh Poimboeuf <jpoimboe@kernel.or=
g>;
> Ingo Molnar <mingo@redhat.com>; Dave Hansen
> <dave.hansen@linux.intel.com>; x86@kernel.org; H. Peter Anvin
> <hpa@zytor.com>; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Thu, May 15, 2025 at 08:47:56AM -0500, David Kaplan wrote:
> > Restructure the ITS mitigation to use select/update/apply functions
> > like the other mitigations.
> >
> > There is a particularly complex interaction between ITS and Retbleed
> > as CDT (Call Depth Tracking) is a mitigation for both, and either
> > its=3Dstuff or retbleed=3Dstuff will attempt to enable CDT.
> >
> > retbleed_update_mitigation() runs first and will check the necessary
> > pre-conditions for CDT if either ITS or Retbleed stuffing is selected.
> > If checks pass and ITS stuffing is selected, it will select stuffing
> > for Retbleed as well.
> >
> > its_update_mitigation() runs after and will either select stuffing if
> > retbleed stuffing was enabled, or fall back to the default (aligned
> > thunks) if stuffing could not be enabled.
> >
> > Enablement of CDT is done exclusively in retbleed_apply_mitigation().
> > its_apply_mitigation() is only used to enable aligned thunks.
> >
> > Signed-off-by: David Kaplan <david.kaplan@amd.com>
> >
> > @@ -1125,6 +1133,14 @@ enum retbleed_mitigation {
> >       RETBLEED_MITIGATION_STUFF,
> >  };
> >
> > +enum its_mitigation {
> > +     ITS_MITIGATION_OFF,
> > +     ITS_MITIGATION_AUTO,
> > +     ITS_MITIGATION_VMEXIT_ONLY,
> > +     ITS_MITIGATION_ALIGNED_THUNKS,
> > +     ITS_MITIGATION_RETPOLINE_STUFF,
> > +};
>
> This is in between retbleed declarations, I would suggest to move this be=
fore
> retbleed mitigation starts.

Ok

>
> enum its_mitigation {
>         ITS_MITIGATION_OFF,
>         ITS_MITIGATION_AUTO,
>         ITS_MITIGATION_VMEXIT_ONLY,
>         ITS_MITIGATION_ALIGNED_THUNKS,
>         ITS_MITIGATION_RETPOLINE_STUFF,
> };
>
> static enum its_mitigation its_mitigation __ro_after_init =3D
>         IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_MITIGATION_AUTO :
> ITS_MITIGATION_OFF;
>
> #undef pr_fmt
> #define pr_fmt(fmt)     "RETBleed: " fmt
>
> enum retbleed_mitigation {
>
> >  static const char * const retbleed_strings[] =3D {
> >       [RETBLEED_MITIGATION_NONE]      =3D "Vulnerable",
> >       [RETBLEED_MITIGATION_UNRET]     =3D "Mitigation: untrained return=
 thunk",
> > @@ -1137,6 +1153,9 @@ static const char * const retbleed_strings[] =3D =
{
> > static enum retbleed_mitigation retbleed_mitigation __ro_after_init =3D
> >       IS_ENABLED(CONFIG_MITIGATION_RETBLEED) ?
> > RETBLEED_MITIGATION_AUTO : RETBLEED_MITIGATION_NONE;
> >
> > +static enum its_mitigation its_mitigation __ro_after_init =3D
> > +     IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_MITIGATION_AUTO :
> > +ITS_MITIGATION_OFF;
>
> Ditto.
>
> >  static int __ro_after_init retbleed_nosmt =3D false;
> >
> >  static int __init retbleed_parse_cmdline(char *str) @@ -1242,11
> > +1261,19 @@ static void __init retbleed_update_mitigation(void)
> >       /*
> >        * retbleed=3Dstuff is only allowed on Intel.  If stuffing can't =
be used
> >        * then a different mitigation will be selected below.
> > +      *
> > +      * its=3Dstuff will also attempt to enable stuffing.
> >        */
> > -     if (retbleed_mitigation =3D=3D RETBLEED_MITIGATION_STUFF) {
> > +     if (retbleed_mitigation =3D=3D RETBLEED_MITIGATION_STUFF ||
> > +         its_mitigation =3D=3D ITS_MITIGATION_RETPOLINE_STUFF) {
> >               if (spectre_v2_enabled !=3D SPECTRE_V2_RETPOLINE) {
>
> SPECTRE_V2_EIBRS_RETPOLINE also enables retpoline.
>
> >                       pr_err("WARNING: retbleed=3Dstuff depends on
> > spectre_v2=3Dretpoline\n");
>
> This can be updated to:
>
>                         pr_err("WARNING: retbleed=3Dstuff depends on retp=
oline\n");
>

Yeah, I noticed that too.  But the existing upstream code (before my re-wri=
te) was also only checking spectre_v2_enabled =3D=3D SPECTRE_V2_RETPOLINE i=
n retbleed_select_mitigation().

So it seems like CDT previously wasn't supported with spectre_v2=3Deibrs,re=
tpoline.

If we want to change that, I suggest doing it in a separate patch.


> >       }
> >
> > -     if (cmd =3D=3D ITS_CMD_RSB_STUFF &&
> > -         (!boot_cpu_has(X86_FEATURE_RETPOLINE) ||
> !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING))) {
> > +     if (its_mitigation =3D=3D ITS_MITIGATION_RETPOLINE_STUFF &&
> > +         !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
> >               pr_err("RSB stuff mitigation not supported, using default=
\n");
> > -             cmd =3D ITS_CMD_ON;
> > +             its_mitigation =3D ITS_MITIGATION_ALIGNED_THUNKS;
>
> This and ...
>
> >       }
> >
> > -     switch (cmd) {
> > -     case ITS_CMD_OFF:
> > +     if (its_mitigation =3D=3D ITS_MITIGATION_VMEXIT_ONLY &&
> > +         !boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY))
> > +             its_mitigation =3D ITS_MITIGATION_ALIGNED_THUNKS;
>
> ... this are essentially resetting the mitigation to default. This will b=
e more clear if
> you could change the mitigation to ITS_MITIGATION_AUTO here, and at the e=
nd
> have:
>
>         if (its_mitigation =3D=3D ITS_MITIGATION_AUTO)
>                 its_mitigation =3D ITS_MITIGATION_ALIGNED_THUNKS;

The point of AUTO is really to say that no cmdline option was specified.  T=
his is relevant for my attack vector patches because AUTO means "defer to t=
he enabled attack vectors".

In the attack vector series, AUTO is checked early in the select function a=
nd the mitigation will be disabled if needed.  If it is needed, the default=
 mitigation is chosen.

In the current code without attack vectors, AUTO just always means pick the=
 default, but is really a preparatory thing for the attack vector support.

The code you highlighted deals with cases where an explicit cmdline option =
was specified asking for mitigation, but it can't be done.  Falling back to=
 the default option is fine, but calling it AUTO I think would be confusing=
 because AUTO (in the next patch series) means "defer to the attack vectors=
".  So I would prefer to leave the code as-is.


> > +
> > +}
> > +
> > +static void __init its_update_mitigation(void) {
> > +     if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off())
> > +             return;
> > +
> > +     switch (spectre_v2_enabled) {
> > +     case SPECTRE_V2_NONE:
> > +             pr_err("WARNING: Spectre-v2 mitigation is off, disabling
> > + ITS\n");
> >               its_mitigation =3D ITS_MITIGATION_OFF;
> >               break;
> > -     case ITS_CMD_VMEXIT:
> > -             if (boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY)) {
> > -                     its_mitigation =3D ITS_MITIGATION_VMEXIT_ONLY;
> > -                     goto out;
> > -             }
> > -             fallthrough;
> > -     case ITS_CMD_ON:
> > -             its_mitigation =3D ITS_MITIGATION_ALIGNED_THUNKS;
> > -             if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> > -                     setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_IT=
S);
> > -             setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > -             set_return_thunk(its_return_thunk);
> > +     case SPECTRE_V2_RETPOLINE:
>
> Also SPECTRE_V2_EIBRS_RETPOLINE.

See above.

>
> > +             /* Retpoline+CDT mitigates ITS */
> > +             if (retbleed_mitigation =3D=3D RETBLEED_MITIGATION_STUFF)
>
>
>
> > +                     its_mitigation =3D ITS_MITIGATION_RETPOLINE_STUFF=
;
> >               break;
> > -     case ITS_CMD_RSB_STUFF:
> > -             its_mitigation =3D ITS_MITIGATION_RETPOLINE_STUFF;
> > -             setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > -             setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
> > -             set_return_thunk(call_depth_return_thunk);
> > -             if (retbleed_mitigation =3D=3D RETBLEED_MITIGATION_NONE) =
{
> > -                     retbleed_mitigation =3D RETBLEED_MITIGATION_STUFF=
;
> > -                     pr_info("Retbleed mitigation updated to stuffing\=
n");
> > -             }
> > +     case SPECTRE_V2_LFENCE:
> > +     case SPECTRE_V2_EIBRS_LFENCE:
> > +             pr_err("WARNING: ITS mitigation is not compatible with lf=
ence
> mitigation\n");
> > +             its_mitigation =3D ITS_MITIGATION_OFF;
> > +             break;
> > +     default:
> >               break;
> >       }
> > -out:
> > +
> > +     /*
> > +      * retbleed_update_mitigation() will try to do stuffing if its=3D=
stuff.
> > +      * If it can't, such as if spectre_v2!=3Dretpoline, then fall bac=
k to
> > +      * aligned thunks.
> > +      */
> > +     if (its_mitigation =3D=3D ITS_MITIGATION_RETPOLINE_STUFF &&
> > +         retbleed_mitigation !=3D RETBLEED_MITIGATION_STUFF)
> > +             its_mitigation =3D ITS_MITIGATION_ALIGNED_THUNKS;
>
> The =3Dstuff mitigation depends on retpoline, not really on retbleed.
> Shouldn't this be handled in the switch (spectre_v2_enabled) above?
>
> >       pr_info("%s\n", its_strings[its_mitigation]);  }
> >
> > +static void __init its_apply_mitigation(void) {
> > +     /* its=3Dstuff forces retbleed stuffing and is enabled there. */
>
> Oh, this is why you are depending on retbleed_mitigation above, this part=
 is a bit
> confusing.
>
> Will think about it more later, trying to have a couple of days off.

It is a bit confusing, no argument there.  And why I spent most of the comm=
it log trying to explain it :)

I do prefer this way of handling it though compared to the existing code.  =
The existing code would *change* retbleed_mitigation in its_select_mitigati=
on() which I think is very confusing.  I believe the rule for these functio=
ns should be that xxx_mitigation is only ever modified in the xxx_select_mi=
tigation() and xxx_update_mitigation() functions.

If there's another idea though (or a place where a comment might help), let=
 me know.

Thanks --David Kaplan
