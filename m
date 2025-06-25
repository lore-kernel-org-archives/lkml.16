Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B133E1;
	Wed, 25 Jun 2025 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817923; cv=fail; b=HHalhh5SkE/Yjkk0g/pp6nZ8gD6v+f7o0mCUQVpCaeTLKpENYHmBS0oqBc4iuub4V8X0l35wiyL3arWjrMQfcB62l0FOuBcHO0S2eBvTqdZZHBE4o27ncI8PYyjLimnPp1p8IBKKW946pbTCVM+IGTug1IUdAnG8Bbl5eVjcHy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817923; c=relaxed/simple;
	bh=7M7wNKw2C/aBC9vSUOVcbYezEDS6HNXnPE2t2Gwq1+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P0hkSmUnkBtNnpbanncZRr4zfi+2l9usByT6p4bwFgqZpRbiGzhqZefMeRB/NzIadccuLOQj1GMWFWBc121klfUICIqi2A9Xh23PbCXki4IMuJtF5S11ZGSh+dyU506+U0l75G5i+PYwxiP1IqYUGe0PPwQ26lJdpglvSQ/8yeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OfdRks2S; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OfdRks2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIRX/ZgaKuhG90GNl+jEHSeCZXUsGU25+RR62dybkpYB0FzY3+KioEJf2jkAvmUK1keog4NzI9M1aPNJTOEpS+1WK/52/IyoVFz4UAUQa/vHmR8adqq7yWljqppxkrG7OldeTPtLyju1syvTQYVXS59ExMqqGOXpCfP37ppStkJf9NTM4IGhrjfZEu2vQOZMBVtAC8fsSaOS1Uv7mjsBoTElWemxlLj0dUL1Pa4IgeysilbvlcTxcZD0h+Hf8I5ieUL7yPBptfphRNjVSKPqF601XlA3LNAkrX+kNO3NUGHmaVjc/OTSg6nfKEkS2cMlz1dWRdEv/kx3qZvcj0t9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q3eNKHIU7mDhLKgAvJLDncBUoSwoSWppvLwrh0dTs0=;
 b=NXwe20XL9vU8+J7JKweB180/xQ8Cxj/XNmof1b+fxGwia0Ki2x2uQTDFbrk1QsUi23sKcHtRDupc/dmPywd4w87OrgrjfPcXyKM8LvR0e1GWpSfDl878ZN9NolM75yS/HWcHudWuUhdfl7N8FOjf4FcV1u28bUBigLzlWL/1XF05bG/FIddWvKyUvUOi6sE/JWs5Avag3UODYBvCjVMHWwRHGP7VScaZWn7ys9IM4QwtWv02BZ0IlRg8sO2nYOZsnUoQe7xOtKUNsOiurQIqVampwKo/4S/nHm1JY+X4FR7prP4M+QpuA5Xbbbbjl17HSuqoxICLNn1lVBIiQBXfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q3eNKHIU7mDhLKgAvJLDncBUoSwoSWppvLwrh0dTs0=;
 b=OfdRks2SCCqxRTKYrs4IBG23A6/4r2nEU8D66fA+yf8RJEJkj4RrUF/FaKXFCKQrhXZv+WoxgbSwJiYyhg06BKnrT4n5dbDX3W2fqXLyrGT8LY/Y8x7CDTZhVGAnM38jHfJ3uF+8mghad5ABNqhywv7SHu2hxE1fgleeqmWLJ+DYFVOlwlVxUgB9HgexTKw60SKJqFjYe/iV0nD4xwrFlxsVXcEho3mvmofG+OeI2PA/ZzWEUBK3m9VXY6fd1KwufDDU+AQy17pE2lCN1IOSle8kEaZmSP/npqgX7fJtACGbgcFytpnaITRHjZGI9dbav7MyIgcStuxF4zOvWTd2Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:18:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 02:18:35 +0000
Date: Wed, 25 Jun 2025 10:13:48 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>
Subject: Re: [PATCH] usb: chipidea: udc: Use usb_endpoint_is_isoc_in() rather
 than duplicating its implementation
Message-ID: <igmzazos37rffzpuvyy5ubrwozfznphtenkdwosjceq7gcakzw@dtdxbfzhy64v>
References: <e9b363cb-1223-41fa-8613-73ff9a1d4a30@web.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b363cb-1223-41fa-8613-73ff9a1d4a30@web.de>
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 851841b3-f40a-4c40-7510-08ddb38e96c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uqPTYwKU5MkchUe8Thbznu9fNd0+Pbg3gZnF9PDWn/v+1PS080ApVRwV6si1?=
 =?us-ascii?Q?qvum4iyMTWvqwdlWA729qwUNv8BzF8FxKmyLN/tS2U2s+QdVTIxt+xewRNhh?=
 =?us-ascii?Q?/g0m3B9D5UkyVStH1yFfEtgtgDzFsbDo1nolrIea+Rps9vJe8z6g9nYbSqWg?=
 =?us-ascii?Q?HJO7G7p6Lc+86eiOPc5t5NAOzAC1m8y03jlmWMEIKQNZs9Ass3EXpHHs/2w3?=
 =?us-ascii?Q?L6pc8SdBJ1oY+Cfi50XDxYPLw3CVPOICTGPX1TyCouLyOCGAB1CzSgXylO9r?=
 =?us-ascii?Q?YX9b9aB2w56e4luZf98Y9hDQJkZVkXvEqrQ9hqWaHNUcyJvWzzw5mtC9hH1/?=
 =?us-ascii?Q?w3qJrFURjq0ivdma9lYUF9ZB80npeGARmW9XcYP7/TR4tlN4uTZzWX0hojcq?=
 =?us-ascii?Q?tr1UydL1E19QRsCT+tmJKElwNExt+TFiQS7GOv1JfKCEErpGhx1w1nDXVwbc?=
 =?us-ascii?Q?RT902+3fCi81jCA0Ohaix5Yi6rrc8W5JFCBIQsDvcUzVFAyfwAodwnt8QZjs?=
 =?us-ascii?Q?2fjXUzC3rbsr2FwFrFVvGc6Ed85V3gt7uM+1gGgquIeSj84JBNPrdMKQKvb1?=
 =?us-ascii?Q?RGFKBKayjem8PnSejqDwgYNBNc6Nvh+/RIJdpyykaRxrv/88ee8YbrPGlwam?=
 =?us-ascii?Q?RPvQbRx5J4CCEEKSOH8mkD1SZZtFp89CyhMvj4CwqrhZU6RggSY10Hvpzk28?=
 =?us-ascii?Q?0DYizJsPHHDUhulzA2JSLrNozxaFZxS9Xh+gVIZuND+JEGoWyYCBAVwP0gMS?=
 =?us-ascii?Q?iIxCrhzf5r/lXE13XTVSmxSdzXxlC8JyIUblfE+vAEGSmsJOvm4jxsm21M1N?=
 =?us-ascii?Q?25rZOqOtAbh/aVjbSTsttW21ynqpinoYafluRJakHui5lx4i4JQCdG9n7yb7?=
 =?us-ascii?Q?DelmkiLUAOzYLEyP5b4ibEKHlfRIvz5qOCaOB596cpRs+t7YJlgYJ4FfjRyp?=
 =?us-ascii?Q?Q0JitEt5lQFPlyvpGHuVqARGqgcnN45Vgnsmz6x9O4UjsymLVKlpuwLqqMvy?=
 =?us-ascii?Q?pkmIc0OHNDw13VgP8rpnLQ6XOq7DHmIE00do85+tif27oDcwJ+pDKSFPna+P?=
 =?us-ascii?Q?HOxrLZCBKKie4XHAwev+8+lSqfrTil5o/n1AS9Br04CLZLCi2SAQwpaSVnYo?=
 =?us-ascii?Q?aLufAflTH+ViEr3cZ/f7+Cdi7z+LBfDcmVM4HhZKhatTtpoUEhI6ka3Y4UeW?=
 =?us-ascii?Q?nmlUco/5YaRuPW0CFoJCAx4rtLQ/1PJXwdcGtclfI7ddOR0lN0dAMtHeZYTT?=
 =?us-ascii?Q?ncJ2VbKqmkztxjbTpUx+FkugCpQmFiRYVIZS8KJSSZZgUm5qicDLgRQTlLL4?=
 =?us-ascii?Q?RbqBVEkVzerhpV+GfLEeyIlE4yBlrQjrVsCco546M0dhPDbeBGrUZCLI6dzh?=
 =?us-ascii?Q?NzkUNH1vILForcrBuob2qiH/yTQG2C/rKryNLw64N1CJwPFOO6WFOV3FjSCD?=
 =?us-ascii?Q?1Pt/yEG9ItLQQ5qrxKRJv1AO2klLMoaxAaBZzu6bGX8dOlqvhh8FWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pl4YKArUxLPXhl4tKLhpd3IJXa8AxVnSwTo+h7vHbkBlMt83R/+xlC78T1A+?=
 =?us-ascii?Q?yS+unAUgzcmGpoRBdhg1KBoloYLOhp3s17hRRVS9+GZjNYYCRlx3SKbN7eOe?=
 =?us-ascii?Q?UnN734jeEnqLEllvhOs/xf4O9MHtH7MhGCOEQVSPINnEakYusjb2zkVyyA7s?=
 =?us-ascii?Q?q4xnoUycKWW6nBmfcTH9S+kGWylnU2HFp4xDkr9QV+XN+qfCHi3VRqoSHqUs?=
 =?us-ascii?Q?aS06JCAU/DHcnHX1kS8taxfsJFNVUhAzM4zYz4ZGsD0FmeNPEn4CaQJd4urR?=
 =?us-ascii?Q?c6+/RvgRMWwro2yHnMu7SR4lsu2sgDilV3t2YGYuiKxj5LyVvTzym0t5iGoB?=
 =?us-ascii?Q?1xYhD7mHzLsYKaVYFK2jWQz132mq/LYnhDWQRUdvY57vyL6UXxBLMCYXNQtN?=
 =?us-ascii?Q?+ZvrXXlLqDWWciXqVXwPZAGpLswk5wee2Lq8uqjVQWGUS1Ct/mdYnvTIN2zf?=
 =?us-ascii?Q?+5aOJ8AUxrVOZJyWQVi8FvVXlFXrxAhXBVLIfjBlDvLov+zJpr8COqQoKcRY?=
 =?us-ascii?Q?ki95ZXm8MpxN+gHjl+mN0MUMQmEsmVDeLw6n7hqT+1yQV+lWweLqVav0BFao?=
 =?us-ascii?Q?qFJxUzdx30h39n53r1S3l2Yo4JuD+hohQ3KkD5hO4JRs4qMKzskCWh38rbpr?=
 =?us-ascii?Q?h26qku+6gTkhimPcIgKtKwOn8K3NKJyey710hcAy7JlsrqnJqnP2k03RE2UC?=
 =?us-ascii?Q?+EvyuNkzI2Glx1otKX45uaqxyZzGMDv1BezWgDftFWtGR27GAlyo+HTZU1h9?=
 =?us-ascii?Q?/ULuPZUJi0gdIGSaLnURBOCydbgN9GAScZEHVSY/s3BfOkw+BmYXFTo+RUzy?=
 =?us-ascii?Q?jn/u1YPpAFmlp2vG8/aOIanPLLVm8ftCU94+VBrJaNuwfc3IiijWKyfKmtQ2?=
 =?us-ascii?Q?G/rrHAkTUXIDGjOeEI7E/NHAtOOczduE9PabfnVs3JZh4bq1XZeWc0HJtw3g?=
 =?us-ascii?Q?UnFle2CqX+Mk6WM4fIDatodZhVdIuqvQWThkNyG23Y2U/g4OfBFgLa9slqSX?=
 =?us-ascii?Q?rfQuDokxwZ3wsH3wDadKBbJapgZWjkmltMEsj9MDXIrhXcALMu/U1Kaj7xgz?=
 =?us-ascii?Q?uiCtmJafQlRrJJLBm0aq1plDrjdWxES2dppV42qIzyhOPsqi1Qspk2voEtFL?=
 =?us-ascii?Q?QBREKj4eDoIZhZeiao/V8X+tRVRtwhjrLagZQih5Kw+D5j1Qm1S8kX5H75ID?=
 =?us-ascii?Q?VaO8GnK5PiyiMUQKSIXAtj5tQ75Bnd5tYHwQdZEHchgiKYNnywze6/dRT1Kc?=
 =?us-ascii?Q?yyJc8KqiOdjv0EcFzhmbLSZqxidM+b9eWdoGV3pE3nED48Drtxv4tfoJvhQ5?=
 =?us-ascii?Q?lHWjYzRfQZh7HrOU4jAlGP4QCmVXDS/PFDRRGIQZ81ONpC3b25LHOJavm0gt?=
 =?us-ascii?Q?vEqXkhiv51s9sn/JIF65p/bpQ+q8J4Y3NSTVHckRrvBiA8XCIuq5yNwVn7TL?=
 =?us-ascii?Q?kv51t+xc26xdwUWIfwUXmuuX7fG4bAOff96JOt5YpWdUpg3tbzTATVGBKtwg?=
 =?us-ascii?Q?i0asglxzut/uiaVk+xPDMC6HDj2tOjjoHVVLKupiC7n30hePnrIQgV6FyMpm?=
 =?us-ascii?Q?W76eicbxG2YY05WJ3vwzAOtzlGZ0OgKhvRPi9svw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851841b3-f40a-4c40-7510-08ddb38e96c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:18:35.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQPEL+TA+2UmshMk4lgkjxIANLqBTYquUQTvVerSJIEgZk5Yf96EtNxMpi03oi9W7n9DeF7wAnfcKaP1vdUdPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831

On Tue, Jun 24, 2025 at 05:40:17PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Jun 2025 17:30:52 +0200
> 
> Reuse existing functionality from usb_endpoint_is_isoc_in() instead of
> keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/usb/chipidea/udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 64a421ae0f05..75705089136c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1992,7 +1992,7 @@ static struct usb_ep *ci_udc_match_ep(struct usb_gadget *gadget,
>  	struct ci_hdrc *ci = container_of(gadget, struct ci_hdrc, gadget);
>  	struct usb_ep *ep;
>  
> -	if (usb_endpoint_xfer_isoc(desc) && usb_endpoint_dir_in(desc)) {
> +	if (usb_endpoint_is_isoc_in(desc)) {
>  		list_for_each_entry_reverse(ep, &ci->gadget.ep_list, ep_list) {
>  			if (ep->caps.dir_in && !ep->claimed)
>  				return ep;

Ok for me.
Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

> -- 
> 2.50.0
> 
