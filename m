Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F50F171A1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744175442; cv=fail; b=mJenMzOJk1IiNN02YHZw2PJ2mxixuVsnYvFpsHF/LZgDE/isxfM6nI66xzLl52MQyausIauQJr70ymk4OHk4joo0KpQsWvieg4Micev1uUriZ3BAAVKeEg988U2fducCMRNX42GFhen1YqN6a3R4VgMSh0URnu2aIYH8wzmxOOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744175442; c=relaxed/simple;
	bh=KxCsUpmSjTkIUu9sJHOBCgUNWlq7MsVmVbrPhDyhsn8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OgPriF8cRnJ+Zdbu/cjkSCo5k3CDMVyaoipFzFKgBV9R3dzzfBXSFBHQ+j0FK1tqH9ePg/MB4zeInb1Bo1+AuakIOuK82UNt47vM2VZIX1+T4DSpL3zACMnmdydlmcv7puIrpKtIQj3LARdaRlQaroJwOjvJejs8ZW8BDAGea/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jza4Jiux; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jza4Jiux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744175440; x=1775711440;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KxCsUpmSjTkIUu9sJHOBCgUNWlq7MsVmVbrPhDyhsn8=;
  b=Jza4JiuxwG2KMdJLLA4prf4Z+5i+gh4nTSFZFnPdxlyMk2mn9QJPYsei
   vCDMzFn/zbTSnfeS48riG+NHmCSBiXek4UJNQ8vTXlOnxZ8R/IHGJOfb5
   BUtTS7t3pg/3Tf0aOO3meFg/KVb5N5DsEaz7oCGGSBw3LEk/BqxZyWP0F
   vu/jEc7VbLKyTtM1OlttFFfcxdl/EPCKn3tzoFvMc9pMR0uFbnJmUpy+A
   l0dlR1AReBdTL5PmkakMPhLZV+tZZua3XvDtokuV1rU+17mAhA+FcMAgj
   65W0LdaK+E3yr+4yzuXze4IcuWHkTnsi+df/m/TFdwpNcUqUSNNvOk0Wj
   A==;
X-CSE-ConnectionGUID: ZbWfC5IiRMiDiBL+pTezpg==
X-CSE-MsgGUID: Qu+sQoUdRGicjQgF3kbaKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49476170"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="49476170"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 22:10:39 -0700
X-CSE-ConnectionGUID: tMIP6XArSuia6UDUP6FzuQ==
X-CSE-MsgGUID: CxJ6dHTSQL+WmhzI6BuAQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="159452551"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 22:10:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 8 Apr 2025 22:10:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 22:10:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 22:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlbC3pKkh0MDxLDCfzsKpDhVnY8kuUYGRn56HjBEhpvcEwdLT37pgkACfEmkJvEgTWcs4+sWwzqUROxuvLI+qkfKVBfsC5hV0PRLlPxMTje4BpFMVNsyOUukpY8W76Ruvz9w7o0BdmgqORcB75jmVCvUdMzlsJ6oPCtj8n+IpcfFpETfLyKTKQ45nfV0IJTS+1tq0qTr0iR/FTDH41NgU/9biepRp1crpQAOaDbpbrpOsgNfLLmLQWU7JgLyXYCgIQ7VVd943ZNo/E6cKPJBIyO/zIt8RNpOBdNp0TVRC4TVQogaaucio+9h7btzvHCK21dN5hMFEgMP18O52KVL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMvwtLstNHpgUec9l03tKxKn0GSqpUJ1doCHHMSDEkM=;
 b=s12/E+Fph6HceMCv/Er148uFxX8Ku7Szyj92aUObY3A3l6Cy2Mcvby7SI9YtaxP5TNMqwuQbNz3W9oMYxxh/xRbLSUrXDxscs36k4x0Ih5oLdqueVUdoHawkWalyLEW7DcXMrfrsz4nC9dWMNva2BSTcB0DpUCXOo0HNF9jb2oM1Jt4cbYUXq4YR0X5Q9xQKJssUP8tQs2LTjqDqRNApdPz/Ya3NWw4fLk2FN4moTQInaAYTsOl7gyUKIgInEh0xpr28nUgwUMJI0dSQhWy+WwQZZfDAzg+hkJWhql1q9Bvg7XJ4okvpB7ikGWEqrYOnVXUCgthnLGrRNOZLtTz2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 05:10:36 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 05:10:35 +0000
Date: Tue, 8 Apr 2025 22:10:31 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 3/5] x86/tdx: Add tdx_mcall_extend_rtmr() interface
Message-ID: <67f601479a155_720529471@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-3-54f17bc65228@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-tdx-rtmr-v3-3-54f17bc65228@intel.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 3884b94c-88b3-48dd-0a6d-08dd7724dc49
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4z8swUKLS0HBCSKkzUN2DOdEkGGZHQFt1FTQ+Y0VIk7o6XfVh4AaFEhq4nYy?=
 =?us-ascii?Q?kROSvcFuVUE7EqfDQaHOsp8sWLi3ojrp5M2kQA02tr8fhcDT/DfOArYocGSO?=
 =?us-ascii?Q?xfieOQ7Ip110syxy3rN+15R+gOMZTmkksVfRdbuiPQn9/7heXJxwTBh5KOwH?=
 =?us-ascii?Q?LsyOmo6xJbInSaLXxF6dg0A4Mgy8AjiWScWWdSXWX7V2jg2A7y8ObFJSGgv6?=
 =?us-ascii?Q?LjXxGW9JCY/wUUCO/LaRWcHN74CbIUtlAIc5IxcqLV3E/u1q3SHwIOZ3d5Lc?=
 =?us-ascii?Q?sZs8dSJcY5RBSEh2TFxRTSh6GiLzd2Eea2F30w0P5fe6hP8BIuczzNceOATg?=
 =?us-ascii?Q?rNumtBKhLgdXxllwe61Ya5DjbtCOTC0esXXA+dUQfag0PNtwM/ZszPVB2sVS?=
 =?us-ascii?Q?gSE72KtvmM1XIPR1VFjVAiYDfavXuQUyfXe8RKQgrTRwVeKohZor/V6FQB0n?=
 =?us-ascii?Q?+HLxNLyrjC2/LmzhCrjX4Nz8SX4iqZeLFE/lGxpuHQCH1CBhpg09501fSnlc?=
 =?us-ascii?Q?e24bWjk22kqHMD/kFTWupnXcHaGWI5Rb5JTdgyKJ+S+VTS3FSC2EVcTrdHCn?=
 =?us-ascii?Q?jDGvolS0CogUc0qND+YEIQcA/TYjhrxg16hhz1EyJrK40gkkmh8JApazzApV?=
 =?us-ascii?Q?ETfErofQ+ituggHFnSfrf/6Ni0VScnkRrsjlSkwC5P7WciL748g18dr3T4MO?=
 =?us-ascii?Q?xajI8R4gv2G/TSmwpSc9kSvFiT93p3kKak2voBOps1OcvY/V18hOQ7pp8VlL?=
 =?us-ascii?Q?0sslwQpyUB008A3vl5W8v98vsprf/FGIG3ih5E4yYHjzohEqkaC6Vz79eArL?=
 =?us-ascii?Q?KymJm56WceUYrz1S4JbTB4M9ID0DmPc1ePCh+FmyUieChHRsLfeWz5TZygH6?=
 =?us-ascii?Q?X571AAiGUl8lBLkJcY7/9HNZkkhexzxoMn9RVLQfyr491C7albhPvF+ePd8R?=
 =?us-ascii?Q?+VaEA47SFYnfEsnSuSPmNgHZ09g1nfEbF8j+b+eiTtLZybsJQwFtoQxmLeCF?=
 =?us-ascii?Q?d+R/MQuZyeSSEvKcxsLrZrvHtB5/7oHJ5SXl54pOvgfgZATCwidwnrP9/JiD?=
 =?us-ascii?Q?6gFr174DcG9hQ6Gx3xZxGAmk1Gt+dA8o4F5jlTsB4lJEi/oz4OPaTlttWNkX?=
 =?us-ascii?Q?WyENHhs+vjnDmNhZzscOrpjWEUrdn1U0tPnfDJaObkEl+mc5grkSX9DIf37B?=
 =?us-ascii?Q?nnJ+WvfjO1s/aHbIll3r1y4xeo46VhCa25749N+3tHMOwZvPMYm21ICmHBgh?=
 =?us-ascii?Q?f0OT5ooSIoHzKVuH1t0YZMaXzPkcECBCDQd3iudhyWO1kF9fYL5O9pqvGJg+?=
 =?us-ascii?Q?HtknEglkbAO8CdOU9xsVGI9GpKuwrYBCYEHcdcS08/4MQ+7azwDwGb0SKEqW?=
 =?us-ascii?Q?6uBeUHL+iT8yWoWdF2Tgj740023QvmEACazP9HnXNX6onWf6RzEcJam7LskU?=
 =?us-ascii?Q?j0HqQx8m7UA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3xvD/XvC84121qAdFdS6QQ0VB8xXsyOxt52/FBrRv0Jpikg4XXfJS484sq4?=
 =?us-ascii?Q?G6FmklnUZlGS/zNYd/Don7Dsz5d85CuLn+eL6yXFgKXbZzAloPb+gNlxP3Rc?=
 =?us-ascii?Q?D236o4/b0J6HkySmBV98JNpshSvU5u8Xz8Sq1kUNiZriDXTX8s06zoKUKVqm?=
 =?us-ascii?Q?OSLM+JYzkQz5z3yY+sCoogxN4eug8XamKTzno91KXcpaOPGCWCHwvb05lnFf?=
 =?us-ascii?Q?6czpJ992RBLoRZv7kNWVebFzb3s1Kgl5jlJfvMcU87oHBBk5En/dHtlFpY0C?=
 =?us-ascii?Q?YW5cqgbUNmsgEx7yFC6fsG9vgxtEKDZ5u3vr7L+w3g5jRcSEe4Q1JCwMIADK?=
 =?us-ascii?Q?mv6Uoq6dU58VR1JBcGzexrxO8JSexOBGV3yRuw06WpWOHL7X8857wei7FXxa?=
 =?us-ascii?Q?aOnQYjNho5bOQKFiEuO931r7HN/EMW3bi4wF9bv8MEE/5ApqipX8tb7kdCIx?=
 =?us-ascii?Q?YADM0GujeabvUSMwUPtt91DiLbfn1kjc4lwSIl67ORuN+/Fnzudkzb2IudGI?=
 =?us-ascii?Q?V8j2iTmJHTmoOfsgZVYAvaTgrRXOeZw1pXtrscCD/5gnNWtfjp4e6UVx+cl7?=
 =?us-ascii?Q?C7TQekJgAErpsCRvN2lXYn08LiE8fyOxkQ3zQKSqUq5O25pH6ETBRDp5BpY4?=
 =?us-ascii?Q?1/q3+RBW4xudNbK3ry2vP9sAhZ8oidqxOgf9Ea8dnPdDyGDbU2DlrIm2Vz8C?=
 =?us-ascii?Q?iYkqlwj+G0Kqcg5fMejPd5XZpmc4d5dqs5KxJEIt5pNwe+oikjEDI0+gqFyQ?=
 =?us-ascii?Q?NfXDAP2OJiM+OQKUADYIOjtbbyNeKXY1Dxl8l/YCGoUw1cpUrNcXIRum5HYm?=
 =?us-ascii?Q?Eukh+mVJhK+DINOgXAhkmlMezVmSEqrUr4UudyHSExRkeIbwGdWYo4nKcRF2?=
 =?us-ascii?Q?kZRZuxbtjl6wYXGboIX2cJRWLaJ/jw8xuduU/pUnNiMnQlwwIAbDNVqiIOGj?=
 =?us-ascii?Q?luZgHCB+lLbhjybeZUPEP023x4MTKr7I5jm0T99zmS0zIl1tdz4kh4vfGRY2?=
 =?us-ascii?Q?og1jI1RApfxkqgjJNGFDTOP1dhuj0GCBXfsMCMnyqy1nkkHnn4QpORcW+n/l?=
 =?us-ascii?Q?T6GF5GqhHnH7RPeuxW+sKVev4qMGOBnoLtMX0WA8nPI6GdOEXEMczWqJ/w9n?=
 =?us-ascii?Q?deeEIc+nym1nPuRbUCuuG4M7lRj5cJ2A3fNDME8pvPVAfqqgd5CVXBxe+OZZ?=
 =?us-ascii?Q?kkJDhtfwpLpHV7o18FVGCV+gBzbD33VcEIzsoI1w75ZB05GVIRGyvlaQLj0s?=
 =?us-ascii?Q?HEctGn2/jwfRHmqBJAH8oCi7mfldBg/WWMIQTmIR9VnxJz0Y3UvUGXI4gCaJ?=
 =?us-ascii?Q?KRUUIuVq9844sf7qGX9wPyWJNezE861tnfGXRuL0+jyfCbSUXfAsZm4xXmED?=
 =?us-ascii?Q?3TWrwyMWHdEv4LzFqDjeTQ7erwOGP1ig50ZiN8sM8gSAUrhj9zd8RLnZ4kUH?=
 =?us-ascii?Q?H5a90kwh6qB/MLq/HhP1HYAmL7UdCK3eaoW5uSSPKhaMUq30TPrgKuwUn3cp?=
 =?us-ascii?Q?Bbnwoc+Kkb5Epj5K3IHZl111kAYURiF2ywmXOqXNJ1xNWBrDkMUmxBkmxfq4?=
 =?us-ascii?Q?e0kiM0flT2cZ36rPUYlhu+7DSWPwV2hS7+VzmlL3b/zrDFsTGtSRNvaQ+qEZ?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3884b94c-88b3-48dd-0a6d-08dd7724dc49
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:10:35.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfVt+AXyrGROzTRvTJZhuIaTC69N3aQkkcMFbN23sFNmRmYU4eTls5sP5rSS0zbZXEn267CElnR9xDk184dNIoPntQnAXkER1yDuPIyPEx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> The TDX guest exposes one MRTD (Build-time Measurement Register) and four
> RTMR (Run-time Measurement Register) registers to record the build and boot
> measurements of a virtual machine (VM). These registers are similar to PCR
> (Platform Configuration Register) registers in the TPM (Trusted Platform
> Module) space. This measurement data is used to implement security features
> like attestation and trusted boot.
> 
> To facilitate updating the RTMR registers, the TDX module provides support
> for the `TDG.MR.RTMR.EXTEND` TDCALL which can be used to securely extend
> the RTMR registers.
> 
> Add helper function to update RTMR registers. It will be used by the TDX
> guest driver in enabling RTMR extension support.
> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Typically Signed-off-by without Co-developed-by means that the patch was
submitted upstream be Sathya, so did you also intend to add a
Co-developed-by or should this solo tag just be Reviewed-by?

> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c           | 36 ++++++++++++++++++++++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  arch/x86/include/asm/tdx.h        |  2 ++
>  3 files changed, 39 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index edab6d6049be..b042ca74bcd3 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -36,6 +36,7 @@
>  /* TDX Module call error codes */
>  #define TDCALL_RETURN_CODE(a)	((a) >> 32)
>  #define TDCALL_INVALID_OPERAND	0xc0000100
> +#define TDCALL_OPERAND_BUSY	0x80000200
>  
>  #define TDREPORT_SUBTYPE_0	0
>  
> @@ -136,6 +137,41 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
>  }
>  EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
>  
> +/**
> + * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
> + *			     TDG.MR.RTMR.EXTEND TDCALL.
> + * @index: Index of RTMR register to be extended.
> + * @data: Address of the input buffer with RTMR register extend data.
> + *
> + * Refer to section titled "TDG.MR.RTMR.EXTEND leaf" in the TDX Module
> + * v1.0 specification for more information on TDG.MR.RTMR.EXTEND TDCALL.
> + * It is used in the TDX guest driver module to allow user extend the
> + * RTMR registers (index > 1).
> + *
> + * Return 0 on success, -EINVAL for invalid operands, -EBUSY for busy
> + * operation or -EIO on other TDCALL failures.
> + */
> +int tdx_mcall_extend_rtmr(u8 index, u8 *data)
> +{
> +	struct tdx_module_args args = {
> +		.rcx = virt_to_phys(data),
> +		.rdx = index,
> +	};
> +	u64 ret;
> +
> +	ret = __tdcall(TDG_MR_RTMR_EXTEND, &args);
> +	if (ret) {
> +		if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
> +			return -EINVAL;

Here is where the ABI documentation can help to make sure that userspace
can tell the difference between userspace bugs, kernel bugs, or TDX
internal errors. So perhaps translate this EINVAL to 
ENXIO in tsm-mr.c. Otherwise, this patch looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

[..]
