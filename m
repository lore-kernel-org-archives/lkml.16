Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54998139D1B;
	Fri, 27 Jun 2025 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007234; cv=fail; b=jy1oAuSW5ov4g8SuFI4PjSJIXlou3+dq19DM6NEDQ7NHHo1KNphpPMOv4O65MmbOdjLxYclF+z9fIkXca2rcxUZDCjV6FNgOxnlTaoE6+qlfs2BZuz09vQYU8g6+MQUcpaNfXri5/1PWR6MZa4bxIP8E+eCYrqfAlkvJ6/Wg/8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007234; c=relaxed/simple;
	bh=czh/XfgrkAj0Us66csoeeQFvYbensY82oyQ9dOGlCp4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I9pNj6gjWMQhBtjxXQPlzA9POhwOUJ0FYxJaHIeji8zucSoaC2W4i3cmWyNwdsEPXLHgIOJ0lL4pMnH0zKen6OL/lePpvJFIRdwoKX+s7EeZt0Misjrwb8b5UBcsfWD+5y27ZHvDhEA+qHRM6Vl2iX6bSV5OXPtx4dyww5Nh6GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HX1oIubq; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HX1oIubq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751007232; x=1782543232;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=czh/XfgrkAj0Us66csoeeQFvYbensY82oyQ9dOGlCp4=;
  b=HX1oIubqa+ktPkhPdTVR7BuyZnso83Xm/dVr1WWzfZLnXa2qQT2hAD2u
   Fxx/vvKIvV0Uf7dBDuNUji9+l8gVQ9DG/ZgTY5IMOrEcC6Irz8OHlrNQ1
   vL4gPQ4WLt3TE5eIlqmBU/yc2PnjJZChgERGwBd8uOUt7As5o7ZFBzD1g
   PkwHZhB7o9NnUxFYqjoEZ0d+GthJpmX9huzcf/7NZ13tHG359NQdwv+xq
   ThBVHl+Tk5eOFlOSR6oCVSfGapkRLLEWnFZ+z+33cMMgRsyLtWqXBPq6X
   JbTzfLl8VGtAgMDPmrhgXXcBVzhbZ5cxKGhDc7PG8mPOV2zC5krrUw+rV
   w==;
X-CSE-ConnectionGUID: g+h9F6ymSyiHihBytzmRWA==
X-CSE-MsgGUID: akammGXUQrqUigAtZ0ncsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64004580"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="64004580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:53:52 -0700
X-CSE-ConnectionGUID: gX+aW8MyTfW3842UODFmZA==
X-CSE-MsgGUID: 0oFWL64cSiWJ7q4f1MM9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="153249400"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:53:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 23:53:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 23:53:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 23:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6Q7obhLv6HpT5Jf2ckwJw34B7x+ntDTVD2jIcf8XdPBQ4l3GMiUQyXWC9b+RZeCAe+OPGmZEZEvbmj75B46ajtd5r86217tFBb+XphTkqQptGbpSI7/bWDejPhjXnFCVThHsl5VEK3GkekM5D7WjLPJdn3jgJelYqqAdv4rxaivecCR1FW848nNdH3MbUCCNtvxLFCcaRL0KX3mIQdMXVWgmmtc2rwA5OEEEw+SrwYXlSw3An3cmWNV5RnMmzPKW6QzKGxxcmF85+l1Q5CGHfPMnhkkVFl2qBP0vJksn/YPPciexFp80Lebuxi3k31Dl30THCZ1n+YETCO9zWLnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wET6dCpxFGEUKK439QVjgAHWLNLPxNzSx3pw0/rPw+w=;
 b=vZFBr9p3Q2bI6/kaLSYNdFX7d8s9VqyLxP+VeJHtvBlWW1F8mBM2grGD+xnA47/10a9GOJnBwwd/KRtQ/HJRp/e44pxFnL1j2rVSiRUB3CRLvt9TkIQpYtIKw1hY2aj8D2SqxzzwZmrRz6r3dgNzzLYQZrcjjJcauYc5l1CSMngGEXSWQk0/Z3+RgcLl/3PKYNbTVaE0XPAJJ/K7+LFaz7ZhpZVmGIsNY7iuuLCJ4UD0WI1dzIXLo3dgpX/ceam54tAh5mr7hxR64bpwKk+tSHLAmdXojleeayHOOYQDQ7KyyKbbqzCYtSJGxDJbAEz91yJ632HmIKplcbleGpGrfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 06:53:49 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%4]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 06:53:49 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
Thread-Topic: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
Thread-Index: AQHb5pFpstZZcKKX3k2MtQWa73CvFLQVW/AAgAEnekA=
Date: Fri, 27 Jun 2025 06:53:48 +0000
Message-ID: <SJ2PR11MB842425A1CE631E71E4AF26F0FF45A@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
 <f95f6777-7445-46dc-be53-b3ae5594bf39@linux.dev>
In-Reply-To: <f95f6777-7445-46dc-be53-b3ae5594bf39@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: 1e5bab52-b89f-457f-ca06-08ddb5475e82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bkIslkEERwBP3lf0a5KT+DmSBky4/x1Nx9alAXoV0XM0VOxjsZir0XdVix5z?=
 =?us-ascii?Q?fliD8QTc6JeEZN/rPjGlcruLtEuNWh2+51dH/ppzTmQdEFL6/KxDt6DjY0Qn?=
 =?us-ascii?Q?h2QHOj+ZfK35tjsfH9XxIPnABa8ieUZ6GJln+/mUfcJpzW7UMx1LH2CNs9Oy?=
 =?us-ascii?Q?EicMs9jiMOu0KSAo6txuLxW2HLWMt6XdB8HGx+EhWvsiJGEU4r2z6+tPOalU?=
 =?us-ascii?Q?xYAuOrzF0ih+LP1/ITMSOPcilwEdPTSODdIJw02yIP+XOo/i1S0EBH+ekUAk?=
 =?us-ascii?Q?z0Eke5A/QPcfsVyG6BYROVjOHZYqdLJGaezzp5IwQec5BAtWypI2eAki38lp?=
 =?us-ascii?Q?/yYta6ppv0ZzmZTROFmZ6Nu6ZWa3Lb5unyr8PUXhRgCd98B71DWx9AtZbUWk?=
 =?us-ascii?Q?OXo1a/8TwN7D5tgZKYuUfJcXTH33NJ1NLYorRNTh4CBG/5ALfLZ5Ljuw0MiJ?=
 =?us-ascii?Q?PZwt7g6DcTuegZaNrfTOH18QaWg1NBJB3c8vVXyrdmzXVnTU+SFCs5oi96jb?=
 =?us-ascii?Q?b41ptLtfmoPX/wDwHvTXUnrodje5zORfuI+jgMvHH7Qrkn0FxhrBHk8XYQEa?=
 =?us-ascii?Q?Einvps/BSy1vuworkxYocctPgyuu42dPy+5xW5alSTshJZgjdj4XP+yOLCBp?=
 =?us-ascii?Q?LNP0fBSopHz8sk17hKP544BEFG/bbF12Oj5ZKH2dLepDUAavpcl2uHupDF2m?=
 =?us-ascii?Q?Ky2lgQIyIkMg6IVMYWx8IwSN0pbVR1yjhlF8EQJ1MsTouFh+jokaitdvkqzx?=
 =?us-ascii?Q?/LmKavXvnMu0Je3I6G2TksZhE5n963jqZ67HE5jPJNYHCHqGUc1qbnjPL2Vl?=
 =?us-ascii?Q?fUgDBmdxGJD5iJ49cvVLu40x8F9sN60TeBTGbGVgu3ZJsITjnSScBaKDFq8l?=
 =?us-ascii?Q?zfA09nuQl7oBoecNX+gmNhbvEG/OznbjecQr2FURqjxaw0c8VqKBWOeFTI9v?=
 =?us-ascii?Q?vUGk1qO8UUNsWQo4gTs6T4sL04YIVvYgm6rtkUYaDqOiS0PxtRv+ozjF7SJ9?=
 =?us-ascii?Q?gQz1E+uEZTr2YFo+Ab2FKWHO98fN7EwbwgAWsXXijoBVCMW3OdLtkDwcRf60?=
 =?us-ascii?Q?2v3davdJfN8+5/4VEBWWNpvrd7v7wZZXIJuVP4WueVxnuItwwGLbRJ7L2Jdg?=
 =?us-ascii?Q?a90QUX9a7pwji+xCufD5BSSC85+rv28KO88gG1oMrJYrYwOab1BOgpQn4wIT?=
 =?us-ascii?Q?SF7qkdX4/yiGkptHwUjmaa+agSR8BsHGFL49Py6I/wxCY94CwVbjenz4G01h?=
 =?us-ascii?Q?57Zq5k4PBcEr1o8ScD1Y1e9Vc2ep6sYMqUKpMiId1nXbNGezlLKUZsRtU7gv?=
 =?us-ascii?Q?t9cTzQiwI2lrneazdef5cMDJQ6P2AInUn+fqndWIh4+7eN2+ihHr+eGl8px8?=
 =?us-ascii?Q?65utpYB0EyNuHcdtK3H5Xz6UwlOH4+uJV9icRjmw9qc8fxEJ2fTSE87xeMZu?=
 =?us-ascii?Q?ObIRj6UWL4dH+8i+5y15XZxQx5P6nMDYIXlbS8ae+pYB/J7WTDE/cg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KU1qW3S4+R1uCAi1JSvUGKgtzWQdiiRhH1ZU7QxdcqKKaWKb5/eW0juoErRf?=
 =?us-ascii?Q?d3QaCtCaEJYoTacPGcsou6qYQjuJBiGxB5+WOG4k4YSdsf8ZO7xDLP9ZrS/E?=
 =?us-ascii?Q?M27OAW9qFXm59Or0EP/PdTEhPkrIdheuL91Ze7p+SNA1S4kkAOZzid171mx2?=
 =?us-ascii?Q?OgOwXTuSqx7hwnb593Kt6Wfqs2PJU93IXRnCrEA83ge7ugdpL9GluPEv3gTe?=
 =?us-ascii?Q?Oa9svqTYOrFMV0HBuuKSxpqnPP6JPfv9drs3hSqvNQmiLFe7HfA38vjrcr0J?=
 =?us-ascii?Q?SzznamnPYg9l8F1rGY2et1jNUVS+/SFI82JeKjAqYXpWnYnrsu0WqDPWLkcl?=
 =?us-ascii?Q?+3m8ViMCzxUeYe8zAWb6uYYC/jMtQq3oEEa1AOS70/WLt8ElDqOVDzetKZOt?=
 =?us-ascii?Q?Clamsa5eBw+k9sLowj1OOokU40TKT2vznrIYOBUf6xPXI4zQZlllFkTpJREh?=
 =?us-ascii?Q?kfEAlm9ikPqvoyk7yAJqG44tkuVSybBvAHN4IvXHkMSWt2Wd96mHJwsWvbXJ?=
 =?us-ascii?Q?pU7wZ7ZGijb3DGL4+IfU3F/2uuh8NcaGKdIN41/9Mc8lBOHRQfcFc1D/btFM?=
 =?us-ascii?Q?Bz7e2l/7irj8Y1z2GQEYpTqjVrwwHFOh9TKYJT/wEf/xd2vSTdVqFFbKvPuz?=
 =?us-ascii?Q?l005vQBTIOnrcek4VMFLjzQJX/ZZHniG2z/8sRzWbxEs+1tA1/d9vkbSe7NE?=
 =?us-ascii?Q?2L7GElhGHpSt5FQL71TtW7BWAQLTfeOQ1kw+vbiKFYIUDJ27gVc0o3Pbc+Pf?=
 =?us-ascii?Q?3FINbshhAcHvZuQcvNWbJUvA+gJYGDGn2dTSVhrPJoeykG710EMPAfPlloj9?=
 =?us-ascii?Q?miRRQtkvVXyUyEMT6pKaBYnvDfkfS3+HINJgIICkCp9TkCptPXCTXjGbSBgV?=
 =?us-ascii?Q?MBZ9/MqoI03fXZX6BYh+FBP3miLxDpEsXbpqZZSqXxKDycnjR0MQ66KFgJgO?=
 =?us-ascii?Q?tVzlsTqv/l5/NbvQDjcbSsjHCE3FgmgLsydenOLDAT87Y0xGKkY6DJiqFst/?=
 =?us-ascii?Q?VDjP7+MennrsoJvh4XMPC4RFXu6kqwKJ71H7UM+eRweZtGHTJxwws9LN2U2S?=
 =?us-ascii?Q?/9asQfS6NZJg6O6XeXAEqLpjElqc7xXq4f1XVFthNlv2LqbFu1vKJT5q2MnQ?=
 =?us-ascii?Q?Iw1k495fN2dFni6v2v/h0SDdRO5JllewI0OGyyoaiaoPnPu4IKws02mNBLLW?=
 =?us-ascii?Q?HcETMl7kMVc1CCcJX+V1k36RvvbVic96yVK66+EWCYdqe2yjRWZFEgRL23TI?=
 =?us-ascii?Q?jDCAG70PZy5H9L1zNAE9wfViue7d0dTqFhuLIxN03luHcLldPQ0hDW8J6P9Q?=
 =?us-ascii?Q?1V9eMKgRKU+yD6cmSsCe1K2FLzuyazEV7Lme0kP3m0xBQHMeTZtvPjLU9T24?=
 =?us-ascii?Q?roDl0rLLgji/Oi+Fgie3xgsh+fiOHELPCKI5yDyaM3RTgEtJ0wlLrfYoSXDi?=
 =?us-ascii?Q?Agy+x5aN7GErjoJUVKfS+GCFs0cLwi/9mJk7HAjUACqVdd5fXWuYp9d9vJcP?=
 =?us-ascii?Q?BnCs1CZemPRhW2IQoa1d2R2/iGU9vYTDNBoSYXCkkV/dGAvxTTlHjiUYHgol?=
 =?us-ascii?Q?9RWPH6eqZ4VJ47/O21k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5bab52-b89f-457f-ca06-08ddb5475e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 06:53:48.9043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qOBLdyHJEq8HuTGCOh/M3FmhC0vefp8gHfX3b4QNDp2fac4e1k5/LPl6jT+OuXtB9lQT2zVPlRvcy6r9qAL4MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Sent: Thursday, June 26, 2025 8:19 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>; broonie@kernel.org;
> tiwai@suse.de; linux-sound@vger.kernel.org; vkoul@kernel.org
> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org; Liao, Bard
> <bard.liao@intel.com>
> Subject: Re: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec ini=
t
> in hw_params
>=20
> Hi Bard,
>=20
> > The current code waits for the codec initialization in the resume
> > callback. It could cause the resume takes a long time while waiting for
> > the codec being attached and initialized. Move the waiting to the
> > hw_params callback when the driver really needs it and shorten the
> > resume time.
> > The change is mainly on the ASoC tree. Let's go through the ASoC tree.
>=20
> While I certainly understand the desire to make the resume time lower, is=
 this
> approach desirable in all cases?
>=20
> My main worry is this: not all functionality in a codec is related to the
> hw_params. One counter example would be register settings related to jack
> detection. You would want the regmap settings to be correctly applied in
> hardware registers even in the absence of any streaming request, no?

Right, not all functionality is related to the hw_params However, the
codec need to be attached first if the functionality needs to access the
codec. That's the reason we do io init and regcache_sync in the
update_status callback when the codec is attached. Take the jack
detection as an example, the codec will be attached first when the JD
event happens. At that point, the driver will do io init and regsync and
then handle the interrupt.

>=20
> The other weird thing is that historically the codec initialization was n=
ever on
> the critical path, it was several orders of magnitude faster than the con=
troller.
> It wouldn't hurt to provide broad-brush information on what a 'long' time
> means for a codec resume, so that we can really see the pros/cons of movi=
ng
> all the regmap initialization.

The main issue is that the codec could be attached after the codec resume.
Sometimes, it could take 100 ms or longer.

>=20
> Another open is that SDCA defines the notion of 'blind writes' which woul=
d
> typically be done during a resume if context was lost. If we start moving=
 some
> parts of the initialization to the hw_params and others remain in the res=
ume
> flow, that will quickly lead to complexity in managing configuration.

I am not trying to move the initialization to the hw_params. The
initialization is still done in the update_status() callback. Waiting on
hw_params is just to make sure the codec is initialized before the
audio get started. And currently, Realtek codec drivers do blind writes
in the io_init function not resume.

>=20
> The last point is that this is a change for Realtek codecs only, would ot=
her
> drivers for other vendors require this change? And if I may ask is there =
any
> merit in speeding-up resume times even for 'legacy' non-sdca parts?

IMHO, yes, other drivers for other vendors require this change.
I don't see any difference between non-sdca and sdca codecs.
They both could be attached after the codec driver resume.


>=20
> > Bard Liao (15):
> >   soundwire: add sdw_slave_wait_for_initialization helper
> >   ASoC: rt722: wait codec init in hw_params
> >   ASoC: rt712: wait codec init in hw_params
> >   ASoC: rt1320: wait codec init in hw_params
> >   ASoC: rt721: wait codec init in hw_params
> >   ASoC: rt715-sdca: wait codec init in hw_params
> >   ASoC: rt711-sdca: wait codec init in hw_params
> >   ASoC: rt711: wait codec init in hw_params
> >   ASoC: rt715: wait codec init in hw_params
> >   ASoC: rt700: wait codec init in hw_params
> >   ASoC: rt1316: wait codec init in hw_params
> >   ASoC: rt1318: wait codec init in hw_params
> >   ASoC: rt1308: wait codec init in hw_params
> >   ASoC: rt5682: wait codec init in hw_params
> >   ASoC: rt1017: wait codec init in hw_params
> >
> >  drivers/soundwire/slave.c          | 17 ++++++++++++++
> >  include/linux/soundwire/sdw.h      |  1 +
> >  sound/soc/codecs/rt1017-sdca-sdw.c | 32 ++++++++++++++++----------
> >  sound/soc/codecs/rt1308-sdw.c      | 32 ++++++++++++++++----------
> >  sound/soc/codecs/rt1316-sdw.c      | 32 ++++++++++++++++----------
> >  sound/soc/codecs/rt1318-sdw.c      | 30 ++++++++++++++++--------
> >  sound/soc/codecs/rt1320-sdw.c      | 32 ++++++++++++++++++--------
> >  sound/soc/codecs/rt5682-sdw.c      | 29 +++++++++++++++--------
> >  sound/soc/codecs/rt700-sdw.c       | 27 ++++++++++++----------
> >  sound/soc/codecs/rt700.c           |  6 +++++
> >  sound/soc/codecs/rt711-sdca-sdw.c  | 28 ++++++++++++----------
> >  sound/soc/codecs/rt711-sdca.c      |  6 +++++
> >  sound/soc/codecs/rt711-sdw.c       | 26 +++++++++++++--------
> >  sound/soc/codecs/rt711.c           |  6 +++++
> >  sound/soc/codecs/rt712-sdca-sdw.c  | 28 ++++++++++++----------
> >  sound/soc/codecs/rt712-sdca.c      |  6 +++++
> >  sound/soc/codecs/rt715-sdca-sdw.c  | 37 ++++++++++++++++++++--------
> --
> >  sound/soc/codecs/rt715-sdca.c      |  6 +++++
> >  sound/soc/codecs/rt715-sdw.c       | 27 ++++++++++++----------
> >  sound/soc/codecs/rt715.c           |  6 +++++
> >  sound/soc/codecs/rt721-sdca-sdw.c  | 29 ++++++++++++-----------
> >  sound/soc/codecs/rt721-sdca.c      |  6 +++++
> >  sound/soc/codecs/rt722-sdca-sdw.c  | 26 +++++++++++----------
> >  sound/soc/codecs/rt722-sdca.c      |  6 +++++
> >  24 files changed, 320 insertions(+), 161 deletions(-)
> >

