Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853D522F;
	Mon, 14 Apr 2025 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624868; cv=fail; b=kW0wKf/4uAt1RtBIHiyBdYzfeARd11R+mWuvlwqQLszBy0u9xaZaCbv/F5+mB54MJzcVPaWNEssMbVOL8PbP3hDssFJnJBYm0Gl+/cAU0HsncaM0XHn2NMV/cVwxyr56dzC0ytZ/jX9Zt5Cs0tyyyP9In6+W4e62Ej5bYF94GfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624868; c=relaxed/simple;
	bh=eLF5pVo5xGyJun7oeqTiegBHUr58ewX5+lLdy/hBMhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQAafRIECFOCujsjR4xWt441zvlKSrBb8sQcF828Fz36dk7i/XJUPxYTLqvuAKcxtRA2564sa1uSMlUxM1MUGUTerJzt2bMDu48maTDe2bn42aEIRnQOrZEdC8u02J3LBrjg1BDd3VdehFAUDBp79oaUDz0xNbR3gVXhuLczflA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o4ELMbDU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pQJzAjeA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o4ELMbDU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pQJzAjeA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5nNpx000575;
	Mon, 14 Apr 2025 05:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ji9fXasXzkc3+2pGzprmfIxqy7m0jf6Bd0s5br83Feg=; b=
	o4ELMbDUndI/5YY6YfO+B+kKcxIcXWec1w0dLHhaTF8XPOAkluk/CDTr5aMQRlPR
	7joB95KVwYFKhuZLVPDJDVtn6uYcPhED/z8ONHrtG2JStTayCj7riwJBGCxXPKvC
	emH2JDrqOOXK+U04na0GpYwuk80zZNwez6rBvURTZn5T8T83xMbte3yg0BzyXwKb
	hb6z1a3XBMY7Dj2qAJRI3Xhqx5PC92KokQv+11xgTH/FnAXEEFN3EeAxdSw9uQyK
	251CcFGtIkVDlviDSP/8QmizY2BzUPmaonXTdcM1SUITf2vZz++tQHgsQ2P7Vzsf
	I3zq7LMk7qqRRUgJHWLk5w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ynjysvmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 05:00:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYJlJ6pEyJUAJl15u7NPimmfD91JkIDJLsOErushm1pAjT40BkqNrkqL5spUe6b74qhzzVMi1M+tl3Dt6aBogsd4/ut2tMNmxBVNqT8ub6mKIiQURwgs05LKBa6BxiJ94WYUSNEVF3VGM/UHGPC4U3qipMm4HDHxlWSy5pbf5Ai+Aae0OUvc/H9zLw+4LObQ15+E+CGVkMvRLAJANy4pYzG1RulEkoCTTlwrifyMGRSk7GKDzX5+/BOt33rAwv/Dq6RYO5VCnIyXY4YdC7D3Hob3oDQB2UhquQuT9SxtizwGTprdluA4qCwHB39DKOMJQMIlQbvZbrrGJZxvwdHi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji9fXasXzkc3+2pGzprmfIxqy7m0jf6Bd0s5br83Feg=;
 b=AEITS3I2tyfWMCE1ra7EsUxl7+ZahcZWHo3I0z3X7Fy1+LCyV8jme5/yiMfne1BghsIFo1NG5sEavQBjtfCDorCcKePddmZfNOH2+0VFhJlJQFYHs4HJPb+OxthJQj1VTJoUC8VYFAQVNtUXPfmAVhrnFR1A1SCyeezxlf9T9tjP2R1WwZwKuvlFuTinQsqv1jx4OiF9I9EOSSAe7NS6PePNJOlt3KmomTy8ZzvEb/zgKiaJEZ0yEY0FMr5HKsUtG9Z+EpJU/cl3CmkhVuSNkc9CqpebA644qDeFViTQ2ZFVOwG1ZWq2qQkyaEQp/jirxqE4g4Mtuz1iEy0Hz0BPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji9fXasXzkc3+2pGzprmfIxqy7m0jf6Bd0s5br83Feg=;
 b=pQJzAjeApFDJ4Om5dP31w6g0O9Rn5h+rynfEPNfwE7gM/ZiFyctIx40rgy1FLnXK7YzTWm1x4wLrjkBnx2SRKh9N71SPv/e0FajhTe6jBjVZAqG+1yfMWDoz/IhUAghedmpRwF4IsZz4B79S0UUwIuBJGJ+vz2mZPTsmiFB/SoE=
Received: from DM6PR05CA0058.namprd05.prod.outlook.com (2603:10b6:5:335::27)
 by LV3PR19MB8479.namprd19.prod.outlook.com (2603:10b6:408:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 10:00:37 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::da) by DM6PR05CA0058.outlook.office365.com
 (2603:10b6:5:335::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Mon,
 14 Apr 2025 10:00:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Mon, 14 Apr 2025 10:00:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10BDB406540;
	Mon, 14 Apr 2025 10:00:35 +0000 (UTC)
Received: from [198.90.208.23] (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EEB32820259;
	Mon, 14 Apr 2025 10:00:34 +0000 (UTC)
Message-ID: <5e48d3fe-1830-4bd4-b882-e2ca435b1c76@opensource.cirrus.com>
Date: Mon, 14 Apr 2025 11:00:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs-amp-lib: Replace offsetof() with struct_size()
To: Thorsten Blum <thorsten.blum@linux.dev>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20250414065904.336749-1-thorsten.blum@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250414065904.336749-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|LV3PR19MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ca9d0c-95eb-4466-d84e-08dd7b3b343f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SElDdHJ6S2tNeEZpdlpseTlMK3l1azdMc2dDeFdIZ2tldHBhdHZteTZLZ0JC?=
 =?utf-8?B?VmF6RE5hZko4anhpWjNJS2hUa2g1NUVQZlN5bGFicEUvTXdzMjBtRXNNdmx2?=
 =?utf-8?B?NjNrRXFYWFF2amtyOFRhQmdOSXJiVjcxMGtZOXJ6aGdGMHFhM1owU1hWbUx4?=
 =?utf-8?B?dnU3K09tNjdwK1lUZXVjeFdGdVIxOVl5cGp6dTZLUnhKSDF4TkZvd1ZCLytm?=
 =?utf-8?B?RDgvb29remV3QlFDQklEVDJWUDREK2lHUzNuRDFFOXQxdnYrMVlwZmhva0Vn?=
 =?utf-8?B?ZUVmV2d5UmdHVUw4SStJSkdnVFMrT3ZuOURVTUwrN1dMZ3hTejdMSEZhZVBq?=
 =?utf-8?B?OEVpRnVXLzFHM2U2ekllN2thNmlFcUVkMUJ2dndtTngzRFJwRkI1WHo2UVhJ?=
 =?utf-8?B?elZUZEhSeVVSYUF1anRyTHFGSlY3YUVEVkRMaTRPdHlCVUtDL1hrNXNuNWJw?=
 =?utf-8?B?bUs1NXFQR1g3QnRRQ2ZCa0gzdlNtTk50MUlYWmJtbWpVTXh2TEFDNXlsWTVK?=
 =?utf-8?B?aVpBWXpJV1dmUjRPRTI4TVh0NHlSWnlqRHlIUjNVTnVReXN1YzNQNFNZUHJ4?=
 =?utf-8?B?aVJjRnQ5K1JvMDRLaXNpbUNkVnpac2NZRXh3dHN1bUZKT3N5SlNPM1hCelZB?=
 =?utf-8?B?Vzg4bnpBVWxnUjNSVDZkQkM3YVE1WEJsb1crYU5za1JIY3JkUlJCdnJKKysy?=
 =?utf-8?B?N3ZzQWFZckRyTkxRVU54YjJGblFzNkFFTWRhQU02Nmx2aGJSN210VXllckda?=
 =?utf-8?B?Z3BVSGlsWHJOZFpUMTJiSkFTVVRmS0lKRHhmckFhdHhpT2tuUGR0R2FIejZ5?=
 =?utf-8?B?bkZsTVdWcWRBc2xndjdncnNhRjdaRUtWWW9rc3J6SnFodVNTNzA4L29TSkh2?=
 =?utf-8?B?SS9MZEhGa1pSQ2w1amZnZjJJcEU0blpST3hmczFKcXB6TDErT0FiVE8rdTlq?=
 =?utf-8?B?dnJCdG1lZGVSdjBMNnpkT2I4UDV3UlJrayswREtNT3pRa2ZGQXBOZjZGQWRM?=
 =?utf-8?B?Tm41V1dhamdYb21kU05xWCthN0o0d3RERy9xbldiVE5BdlhneDRhMDJrSGo3?=
 =?utf-8?B?RmFWY1RRaFlUNDJpTHBWTHNqdGxwK3duWm8vd0tJSm54enNIcTQ0VlIxMGVv?=
 =?utf-8?B?MENQem1RZFVxRlY3WkVaWU5LcHBFUk1yWDZMTUJEbGIrSWdXVktsWXl5L0hx?=
 =?utf-8?B?VlhaSERUOU13aEdCVkhJemd3UW0zbGJJS01YdjV0K1g4QVlsQmFwY2NGYklU?=
 =?utf-8?B?QkhZUXlXNHcwNU5PQ215NC8wK21ObG1GVGpudzhQaStpWjVCRG5yZ3BaeStY?=
 =?utf-8?B?TUpZa2FYakZJTFQzQmw4K2dZUzcxdHpRWmNnaDN0TnpvdFM0TkI0MXU4ck1D?=
 =?utf-8?B?MVJjNnBrWjZKa2xNNjA0VlI3Ti9zWm4wbk1yc3ZOcEo3aXNHMXNaR3BuVGY4?=
 =?utf-8?B?akdkTWR4ODRwcElFcThDd0NnYWloVW5QbVhqMDBtRGVZb2NKM2FWY3RzUG16?=
 =?utf-8?B?a3pwRUhoUG1UY3pJOTZvUlE0Mk5MUVFwMkdudHVCazJFTWNzNDYyZVBaMy9s?=
 =?utf-8?B?R09jbEhzOHE3TVY0cXdBTmhYYXdIc0QrOHVKUEd2NDY1V252c2dTMXJEMFBK?=
 =?utf-8?B?aG1MMFEzMER3T1V2cEJMWStTZm5tZlNvSVc2ajZpWmdTRHcycXZnS2JCNlJp?=
 =?utf-8?B?SjcyNHVSS2I4NlBkMm4yb3VrQzhzb1pFazVlODdvUm82dDg1aXl6REo2NXRK?=
 =?utf-8?B?aEJxS2VMdmZKMEwzajdSYk1CeDVpK3lzZXBXUnBjWmlZeG1LMzJYQzFLR1lK?=
 =?utf-8?B?anZ6YXpTVjZ0ajgxOXVMMGJHbFNEbjZWaWtXVkFma2NkY255TmRmK09yRXFX?=
 =?utf-8?B?dkJxQ2FLUGswb3pYZ0xJZk1GR0J2MUR6VUFtcFJKUXZaaEZmUWJZNkt5Z1NY?=
 =?utf-8?B?YVZxU1JFbWZSbUQxTnFPTlM0MmF4bzNVOEJuajNTckd0b0FuMVAvNVJiMzlW?=
 =?utf-8?B?YWc3U05SWDg1cHBvTWV1dFF5VHNKdDcrVkZRRlRFRmJ3VVphaCtjeEw0RlM2?=
 =?utf-8?Q?IX4vsd?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:00:36.3552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ca9d0c-95eb-4466-d84e-08dd7b3b343f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8479
X-Proofpoint-GUID: aqxl1BafpCEZclibRvY1Pu7r7Zv_47Dp
X-Authority-Analysis: v=2.4 cv=EPMG00ZC c=1 sm=1 tr=0 ts=67fcdccc cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=BVkVmVbSuGOAfwB78MkA:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: aqxl1BafpCEZclibRvY1Pu7r7Zv_47Dp
X-Proofpoint-Spam-Reason: safe

On 14/04/2025 7:59 am, Thorsten Blum wrote:
> Use struct_size() to calculate the number of bytes to allocate and used
> by 'cirrus_amp_efi_data'. Compared to offsetof(), struct_size() provides
> additional compile-time checks (e.g., __must_be_array()).
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only
> ---
>   sound/soc/codecs/cs-amp-lib-test.c | 3 +--
>   sound/soc/codecs/cs-amp-lib.c      | 2 +-
>   2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
> index 45626f99a417..2369fffb58f7 100644
> --- a/sound/soc/codecs/cs-amp-lib-test.c
> +++ b/sound/soc/codecs/cs-amp-lib-test.c
> @@ -40,8 +40,7 @@ static void cs_amp_lib_test_init_dummy_cal_blob(struct kunit *test, int num_amps
>   	unsigned int blob_size;
>   	int i;
>   
> -	blob_size = offsetof(struct cirrus_amp_efi_data, data) +
> -		    sizeof(struct cirrus_amp_cal_data) * num_amps;
> +	blob_size = struct_size(priv->cal_blob, data, num_amps);
>   
>   	priv->cal_blob = kunit_kzalloc(test, blob_size, GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, priv->cal_blob);
> diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
> index c677868c5d5f..c2ce828a96ae 100644
> --- a/sound/soc/codecs/cs-amp-lib.c
> +++ b/sound/soc/codecs/cs-amp-lib.c
> @@ -147,7 +147,7 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev)
>   	dev_dbg(dev, "Calibration: Size=%d, Amp Count=%d\n", efi_data->size, efi_data->count);
>   
>   	if ((efi_data->count > 128) ||
> -	    offsetof(struct cirrus_amp_efi_data, data[efi_data->count]) > data_size) {
> +	    struct_size(efi_data, data, efi_data->count) > data_size) {
>   		dev_err(dev, "EFI cal variable truncated\n");
>   		ret = -EOVERFLOW;
>   		goto err;

It should include <linux/overflow.h>
Apart from that
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
