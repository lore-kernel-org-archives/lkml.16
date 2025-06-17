Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0999A8F54
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750121275; cv=fail; b=sUODoTPD1NcVxoeSInQpiJfDudaj4l0nc3tPwsfUBWYWApK2PV6TFIDBXQybucnrndx4Yc383Itc+SMWnbgNxD+7098LOV3QCTLD7O7yIKapuvqbCy7Wq3EFm6Url6jMS/Lc/wlie9hCP1ZylnpC34D266E2706HZU01hptG+RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750121275; c=relaxed/simple;
	bh=ZH+XPLQcaLhL6oR1aSMzmlWZGJacQkizPsJXK/rcJ34=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mXGlFqIyzX69+bVMLPMlBoxiMauo9FiWhdpdwCKRxbbQVNABbIF387MJMQav5I/wpyhj3mDGlRRynYYDnGLo3oNnpmfmjj/SJQLQulPiwfn72K8zntoeS9xGXl8EfQZ2JsqaZe4URT1BlNmIQH09CsWiT55mkSSwUu9JmqUWhKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXvZEtRH; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXvZEtRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750121273; x=1781657273;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZH+XPLQcaLhL6oR1aSMzmlWZGJacQkizPsJXK/rcJ34=;
  b=KXvZEtRHV3CntdOifile/TTD9ZEKIRPhem79oF+YPy86Agepj9NpGyDi
   er8XyJl5L40cGNGxyjzQd8FhXooSMW0kD+YhFQDZ09Yjv6rq3YqZxpes4
   n3dvIsusPjeb6Y0gzgvp9jTrEmomeYsXpZnX7ILiuvEnvg7NF4erVE0ID
   yHwAIrUJnFBvPJEBr0CvcaoXTSgCgMi2aqrjMgc1Y2QrckHAxhrD/UEpq
   UoRG7n84jmeOOaAuGXbfM6jxFeF2thXW/Jsr6GyJGyV9v25D19b8S1FLL
   hzrAkXTGggkJAad+RrmoGk72rYm8bMXL+ahdweBmmacbR6+3LrXXpRQDC
   A==;
X-CSE-ConnectionGUID: 4qWV7nvySKO8uGTBRKtCOQ==
X-CSE-MsgGUID: R1YwzLP+SCSFQDJFn/4oXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51389976"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="51389976"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 17:47:53 -0700
X-CSE-ConnectionGUID: gDg2I3CBQGeVLgQNchNz3w==
X-CSE-MsgGUID: gicow8IXRMGlDTuuqQK1Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="153785193"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 17:47:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 17:47:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 17:47:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 17:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZut9bMzryDzQpdF79gMflSwS5/X94WpPaZ08IxIdNEsECJxavfTkD+bSbLo9uIIr4tOO4pdh6euYLTHhnOVrRlmXBn8qE4JJGHbJm+579UYjvzmhKV1B3U9NN1VAM0RiL2+OMdKG4CvhiWmLMQPYT+0N6nBF6OwyEUWZHZ34UsCQ0eLJgEQsw3T45QHMejaXvbgHi+Jfj81Xdvc9A38stidOTGnOwCrIU+E4khPIGkfSaV6YXS4tAFH36hcdb5AFuRsv86U+bAMXNfMzEH3089efsK4Xfvs7PDbQQ+q7lmlxZbgeNKZ7xXh8t9x9zGke5Dpn3yTVF2Gh/DT90ESxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnqtpfdWxJbqlfNGeoVbtBTwo2mYvbSlj1TQtMdemCk=;
 b=uACsOfSrYgcSVTb1KK+aVP+sZM7CzMiJ2j0mYy0iDGM2YbxLwvC2H6hclu1YvLHoOz4WKE+DZhsrBy9/P4WsxT8fMRuYDS/KPcCvXdOn0fANzhkav7MTxFuiEWpl5hpjaipGcDBb4HFPrS7VsfduMk84ttGK7YMHBJWEAsRGlNtex4mZeSrwCNnlJuCBHW1W7i+lIL7bptZb8qCbD5iVMHgTLF+5VqO8t7DM/Ra++rz0CdLOhJwX2zuPgLtTw5aOkeCAhHzmP79r8oJF9EVqFIzuVw1M5IYhzv/RtSdoZuXNdruRORE5AuiIcMAeAQI53mn9+mL+AupV9TbK6KY6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 00:47:43 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:47:43 +0000
Date: Tue, 17 Jun 2025 08:47:34 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: ld.lld: error: Cannot export BSS symbol __inittext_end to
 startup code
Message-ID: <aFC7JuM8FTyeKCv1@rli9-mobl>
References: <202506150602.qswx7ZzQ-lkp@intel.com>
 <20250616175026.GA1187576@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250616175026.GA1187576@ax162>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdb21b5-ac95-48cb-5696-08ddad389192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nb2wecsLk8131kRpi8dqE41UKBQ+ss8UwMM/lEuvilYSDJSTUMLMplApDW6v?=
 =?us-ascii?Q?M5woYPZptox/5hnpsk/s/G+FWdD9t8Ik7h9XRP31BMppzKmo8aQPXD65abOe?=
 =?us-ascii?Q?oe2WHluxwh2Zs9CTT5H+i1eGL0SHpMNK5r7pcuIcl3WYuj4wZMziAvRmsNXq?=
 =?us-ascii?Q?P/8EQgpDV7irjHHA7MNGBlkgg6zvYR5FpNzDPmxLINi8PrNwfD4wJNflSSHC?=
 =?us-ascii?Q?Nzew4vnAbgmEuhzBhFDTjZ68X/Xv4cP9LZL4N5eUp8tPlQvFA8Av/+tz5Cbv?=
 =?us-ascii?Q?nRGRi0yT/c4QHpqRx10jjfoh20eWOKTBmsK3cEVyQzjdhKTUKqg097dOzWRA?=
 =?us-ascii?Q?jl65j1U1IxOzQ8W86ob5RShVw93DOCSSqaI1cBcyLeu9UAVfISAfHtfSFd6L?=
 =?us-ascii?Q?BRbQ2DOATNj5lroyobrFloxn6A+xEXZtsbx4aRHyLLtt2QjX1sPkW/CtzKMM?=
 =?us-ascii?Q?cRvKCM+j1t3MaKZOYp2AokkGWFmXR7u6GIeM9ObiLCD6uL+w/N/RZzhtsd3/?=
 =?us-ascii?Q?Ls9wueil2nPANhyOptc8zlV7jBfUURPb0rm2fdisAIMfrnYtR0pMsm6vjQHI?=
 =?us-ascii?Q?oZ6tB/S22ys6QPQKsO5Voh6S3zLeFyb+GlCoPnexYUZp2qAf9m+bbkuQGkIk?=
 =?us-ascii?Q?4NKgdqyQzLN8bYXyQGfTV1aIxQJ+zTWAOXCdYDVnBk9O8eth6YJdww8Ncbij?=
 =?us-ascii?Q?7U6/CPTSRwJozUKm805PDRveDvmSiFqBqRiW1g+K35YxDbf94SiFOtEU+/uf?=
 =?us-ascii?Q?eTKhcYCl7v1o6oPi2EH6FvXjcTxPm3EYxiuMc9+Bfygux2K2tvIElNtJJ0zg?=
 =?us-ascii?Q?AQVpED0cc+h8YNUloJSP+tYmlKyIBb53A9ZDn+2qKuDN5ugi3+AKB8UzLIkc?=
 =?us-ascii?Q?zxpFOLvL+Yt8rMChQuV+FOylvjtQCw0795mrZZxaZvanRWqEG2QJ53apfepH?=
 =?us-ascii?Q?JKRnefvovzZL+oVZ5I0eF4MGSC7AMT0OsxmUSQdnOEeh9zEGwHiF4a79wI+B?=
 =?us-ascii?Q?ZmFDpUZWJx/tSkiBHLaTkJCXOnCWnjya2U5lx6CEVMvgxKbSC3ccR7LnDcIE?=
 =?us-ascii?Q?UE7FXPEp0HkB1qZNGvlRwAHqQrautYn92AKexpulmdOMfGC3y32QWMxJ26Pw?=
 =?us-ascii?Q?WYNaQTOnaMv0heN2taAPRBknmHV4RTpZWoyTKUV4ADCK3xbZOeHq+lblZ8bW?=
 =?us-ascii?Q?Tt9vVmC5q+v3AXOSwVM3SEllwvurPUyW0Xx7xotR5iIWzk34aBw7O4kWwemf?=
 =?us-ascii?Q?VcrHKK25W+ZYWvUkhhACQ3NtS/lCAEMW6Hw11ZQBIgNG3lh71Pvcesaymwih?=
 =?us-ascii?Q?nm12h8OSD0aNzRw6j+wtul8rSu2Wc2GU3Jd+h7HfRz3obgkSW2Ly8vNRRaCW?=
 =?us-ascii?Q?Ws+V1a5YT/jk/nCo7zJGiJj8K9mL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AKti/t91Ffq7UGbzZtTDZtg/Pa/sFV3KKRNxT1yLkez928YisBogzEG2ZHL0?=
 =?us-ascii?Q?Y8xEGqGryRsXg/g2WhKJqL9Li9hYFDmkxg9+r+DNGkeJV3DqBhmOkE/gBYYY?=
 =?us-ascii?Q?mzcdSmJJBLNc6SamLd8SBe/fVxh3GFCD9Rt2ocGWJA6lI5UXWLBeDmqmGPaN?=
 =?us-ascii?Q?JH3EeUx5hfDUlI4UOvMyudI/M7F1HGGpQCblIYAsg3SqdyzVLIJcUgfAc7L4?=
 =?us-ascii?Q?6Wy3wpqIvNqva5fPrH22ofi6F0sFSOuJIDg0sSJDfh99k3l6cSzRJGYkU3LF?=
 =?us-ascii?Q?nkoupUtiwUJDG+RZsGn0VT+2/Zf2uxGXszYOJoHln8JWdH/zSVcdlv+z54M8?=
 =?us-ascii?Q?Rk5nUqW0B2uDtwIQXsWCbGymq+Nt/fWMIKPe+HlIieBizyM6mE+ePiH+aD9N?=
 =?us-ascii?Q?J057vv/77ubBRpn64t5XEo6lZxkuD95KWttoBUhlhKRKoBPgb0kyGOIV00p/?=
 =?us-ascii?Q?tPoRc4D55+TmcS7S9QVYmr/9MIFX5l81skZnrUL3Egap+4CwVMny50pJUa/v?=
 =?us-ascii?Q?t20Wx/XFptEqozv3SezubYc0LFGy3ageo6tDFFAs7G3yPfbdajr99qJwQhcn?=
 =?us-ascii?Q?K9bkAMTf8dYkkyGFQyVN6oKDIz/Ziv+88pPnhPQICYOYquWDUVkWC4KUmV+S?=
 =?us-ascii?Q?K31bTpH44yAAv3mvCV5Iv+rujKaoX0y6GXU+69lytQ9IgnczhBi9cnMpR/Hj?=
 =?us-ascii?Q?SX7Jv0fNmffSiA95G2aWTIlmDyyWx4xoW4CzASNadh55WJ/BlUypQQXMoXs2?=
 =?us-ascii?Q?2AWoSXtOH+UhIWFdUpdwKhtCSUS4Fh2uXyNhOrOcLYP3VCyw33fc7dY2Fxkx?=
 =?us-ascii?Q?CtV54MVXW10LqIdLAzmkWlf2oDH+urLepIpt4AIfFnd2DBqLcqsTEIBQZ4OL?=
 =?us-ascii?Q?+TjwdNoQ57h+Zq6e5y0myG5xbB2Vn1kF5b38r2aFVWXqoxHW1mA8tY/gjm/t?=
 =?us-ascii?Q?3dQpLI69d2pKnmlvhLE7mkTFhGAHq+EUVPujiEjWkUhdaQekbnX5KVQ9FDYW?=
 =?us-ascii?Q?RvWDSUe8PTn0J8RoJgxAiyyb0Bwn1gALG20vIfyo09dwAMaVk9J5PkfP+2e9?=
 =?us-ascii?Q?rq+4Py84lkzDBcHgkp0RucHemN9i/LhIVebjrzqJfdjnJpLpnNMHYC7tB8Lz?=
 =?us-ascii?Q?bW1MvaKvv56v5zyid3n9sxRsfSpjOUYRFZ0ECDNZLhMZMAdw8jtW+AbdyUZi?=
 =?us-ascii?Q?R2NYsY/QS58T47TJ+W6Fla2nwwKs/k/WeV7OumzAg9rpuLrsyLIZqNOOCqdu?=
 =?us-ascii?Q?QG5KYCW25jQ57Y7lF1ffOrstVbuAHUrRQ7agEtboDe2K79ODme0xi6va1pNA?=
 =?us-ascii?Q?EYs9wwCtkjc/qSrIQxPPGmlxFo0kf8ULF5EH+mV+FRkmbSqx5ioXlntSBnNm?=
 =?us-ascii?Q?bZgkppgyyMwi6fz8RXqTodEtJjzeI9ZGyoxU1doErLAyagSGuB+GmO2CciZD?=
 =?us-ascii?Q?kpf7DWSrB59yOBmv8GYJZb4ejnSK8G12mD1gOf+xdnzZ3Sj0DMwHgHlxeiJZ?=
 =?us-ascii?Q?OZ7mhB5N203kU3n1OTLY35xeb/Pj3RmFADwBsL1F4TWKKnkJPjVYjjk5wUYu?=
 =?us-ascii?Q?0DG7uDA/hwpjQhezX+06BJHHnYyZdIHofSL42x5k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdb21b5-ac95-48cb-5696-08ddad389192
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:47:43.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8WHxwTGbd9PA/HsyjME0tSZ69whiGbF1s8GwdliHXObxCYwHvG01Twbw/BrfIg2u9AhAWQo5+pq+BNSljxKxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
X-OriginatorOrg: intel.com

On Mon, Jun 16, 2025 at 10:50:26AM -0700, Nathan Chancellor wrote:
> On Sun, Jun 15, 2025 at 06:13:33AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   8c6bc74c7f8910ed4c969ccec52e98716f98700a
> > commit: dc0a083948040ff364d065da8bb50c29f77a39ad arm64: Work around convergence issue with LLD linker
> > date:   12 days ago
> > config: arm64-randconfig-004-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150602.qswx7ZzQ-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150602.qswx7ZzQ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506150602.qswx7ZzQ-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> ld.lld: error: Cannot export BSS symbol id_aa64isar1_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64isar2_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64mmfr0_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64mmfr1_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64mmfr2_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64pfr0_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64pfr1_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64smfr0_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol id_aa64zfr0_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol arm64_sw_feature_override to startup code
> > >> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
> > >> ld.lld: error: Cannot export BSS symbol _ctype to startup code
> > >> ld.lld: error: Cannot export BSS symbol swapper_pg_dir to startup code
> > >> ld.lld: error: Cannot export BSS symbol _etext to startup code
> > >> ld.lld: error: Cannot export BSS symbol __start_rodata to startup code
> > >> ld.lld: error: Cannot export BSS symbol __inittext_begin to startup code
> > >> ld.lld: error: Cannot export BSS symbol __inittext_end to startup code
> > >> ld.lld: error: Cannot export BSS symbol __initdata_begin to startup code
> > >> ld.lld: error: Cannot export BSS symbol __initdata_end to startup code
> > >> ld.lld: error: Cannot export BSS symbol _data to startup code
> 
> This version of ld.lld is from early April, which does not contain
> Fangrui's fix [1], so this is expected given the stubbing out of ASSERT
> that Ard did in commit e21560b7d33c ("arm64: Disable LLD linker
> ASSERT()s for the time being") does not happen due to the version.
> Please upgrade to a newer version of LLVM main to avoid triggering this,

Thanks Nathan, i will follow up to upgrade the clang version to avoid
wrong report.

> I can confirm that I do not see an error with a current version.
> 
> [1]: https://github.com/llvm/llvm-project/commit/5859863bab7f
> 
> Cheers,
> Nathan
> 
