Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3483595C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771151; cv=fail; b=ue02D8eQ3w9jmgTuQQaT/WvKBfIVrZxuORjP9NCQ75lJ5wvx6aeaeTN9SGLqsT6JcgHrxcUZloES128MMWbR1lOMfQVPlHSIZ8IzMC5NQvOygDxCQ3iIU6PMjn0av0Pp8X41e1U1iMLmMiWr35MAVDWH0VZPl5E95DGo8M+glWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771151; c=relaxed/simple;
	bh=07ctGiF0FOyeDBr/OnHgE/Lcb43OgKPtNMjb+z1NJMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vo52MUR2B2nn3ZEgjyLDW3AL6ve44yVVBg41F05c/Qnsqv4qxt71jI5quiUOwfnVoaE/wJFLnUgnfPqwkzL6qDWLcPjqIyeCzTT2RzJnJX5IgC4q4/CdOiuqQzs8xKjcZreraIglJM8ORJ8XHIg5gzDkLYRIoB+9nnrIkdAt+y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B8vqEV54 reason="signature verification failed"; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B8vqEV54"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooNKlem5uEYDcUOk3bPzBuJ3KrnOYhPNZhmPGfw6s3yoUX0atyw2KscG9pdizWv3JN9tNqNQivVqqXQlRfqVubYRJ5HbwP68GCMjL0w7vPSkBbU61onvK6qjkA52uu8NtQSqh7RI2GBms7dd1so0vUKyFbSADvDhKhKuKnJCV3b6hiccqhgV46fMQ9KWfyYPMC3sjSpjmsg1tU6wyc0fFw1ZltS+mnhNkYgbae2nElezgyknMKJbE5Rf2krbMIgKB4Cay0qCqG9G7pgFzjZfpF4Aqdo9nMwxSu+s6u7otKfDZtwciN6VHizY07Cv2jL/QE4uEABaHGLIlSpqTkMMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeI5evS69AmhVyvQlh3NfodpC6zdOl3PMWKgzlbRnHk=;
 b=kM/Ti8BOtfkYszUFSHeVy+l7du/DA5DyBsbfTX46//NHTMBtr1hpUZVcRaj4aYtAhFqVlLpaLPlTBg4T7TtOBjxkaEG8/z0Of3VbHdzP04eNu08etTdcLiMTtHl9hGI+OCwkh8sCRZ1u675Cffg4kR0fURZUOO0aY6iyrgBJY8fonUXmGaQze/kc5cU4EuSDVPgDtrKwBJzmwcEcoe1qQ0YEXEO0dmUYzLdLoNIaJMGufZWpxUxXXHgJpE90O9vjDqewQadkBHbvJ1bFUiDQBWmRDDcsNKNWs6+4bnvASFvCghfJmx4kRO5TcwobkTIZZuVEKfCVOhNwhLtxEEQnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeI5evS69AmhVyvQlh3NfodpC6zdOl3PMWKgzlbRnHk=;
 b=B8vqEV54VhMmoj/kJYlfqqrS4EzKhZiDs3sMwDAMPZ1XL9WWmlfRIUCo4YrU1eLZB1tXR7526TvonqiZ/WI99w9vihXNhhZDXfgm7FLk8u/sx2opPFKsgVtAn8sYFn1CTxDpt9pBgHM5M9+XmuLUlxZufNp5Q7T4k6WYME/De/tMxirHpYN9VbKoAbQZ+E4OIf+nAOzp0pAHt9i2lJ9qiWxYSnqXlEh4gZuPUgNdw2BT4+aGghATH3T/aHv0WnJIOLxhD38gC8femmJpUL72vOd/A5hPkerkD6dw6s7Ps7xo0kHS/22uxZ+syGlhTM8dPnKYm6sc6IR48XFVQIOYXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6938.eurprd04.prod.outlook.com (2603:10a6:10:117::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 15:59:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 15:59:02 +0000
Date: Wed, 5 Feb 2025 10:58:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6OKvl7DOFrXcB1A@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <928b69ef-e5fa-46ea-9075-2b12d7fd9372@starfivetech.com>
 <Z6I0kSaNIHvRh60Y@lizhi-Precision-Tower-5810>
 <19ea209c-cf55-4ec4-adae-16033fc7d819@starfivetech.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19ea209c-cf55-4ec4-adae-16033fc7d819@starfivetech.com>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6fb52c-751e-4e33-d3fc-08dd45fe02a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?NfnJBV3YhjmT05yD9v1+BvgXGjh4C3KV3jd3rXGMY7c+VA3XpO6EFZQCVc?=
 =?iso-8859-1?Q?SiZS3C3fIrClfisMd8lrJujzX0y5m+VuY7uSsBmpF41kUx69lVhiO63Zq6?=
 =?iso-8859-1?Q?WdXwE+xAYlO6BpoUMMNMxRz5DXxLEhPT0+BRZui401squlun5ibmoMlRud?=
 =?iso-8859-1?Q?rqPTeKVG0TexKchRnTl2FjFbTiTExSmqxo9Z0Kj1xS34xgg+Xes+aBtu+l?=
 =?iso-8859-1?Q?IZ+b/OOOy7iz2zWmaIhbwzX8PNgERXwamI8Xg1jJfpWif0083K+WmDwrl2?=
 =?iso-8859-1?Q?skPfZULvyQXBgoz5NI0sLiSKAB2GB8EhEVyOtIWXEmMvQ/Q10s74ZD9MgT?=
 =?iso-8859-1?Q?yGR76yb/EDdnb/KzcG8wl2K8zoMQre2657M93oDIehKbDh/DU4tJmoiUh4?=
 =?iso-8859-1?Q?XR6OYi0ndD0NMd9tZFbVls3tr59Pw74Y7aMHQWwEPYtsKRjxXOqWbSjOjL?=
 =?iso-8859-1?Q?yG4F149Nr+4tcXMxMyr0WXK+Aed1knB87ieZgf75A0BZoy+ASJkrfKA4+v?=
 =?iso-8859-1?Q?SiHPfZh/TlOD8JN4iFAW11vswsj0wGpEVlmU8geHE+0REFV+pR5zKOWtXF?=
 =?iso-8859-1?Q?0FSFj9ELQ3ld6Da41AaNBolv1YMqUdhalAlIYkZeJGKacXkk//NQDMC+1D?=
 =?iso-8859-1?Q?mHRUFlLqLnn8wkD8kMYF0b3BzuD+fVtTst3waWUiJGS+553gP0Z1Xk/NRY?=
 =?iso-8859-1?Q?35no2i67UDNzZln5Lhb7ELG3gC4YkyXO4f/nh1Gr6lvlSHSP4Bvj5NOoFY?=
 =?iso-8859-1?Q?QZBlvSlsLbZmjBek9CpGSFDREo8LdINrPQfh/12tfURImSkNJGGH/ALxXF?=
 =?iso-8859-1?Q?GyuHPkAFyyh0JZQXquVbTdYoXu55rtfl3daCqQNT/NXHIUgsNqjcKaZLn1?=
 =?iso-8859-1?Q?EmW4wuQm+qhPkpXIevnovpP9ccS8If5sMpxyoK4syE2AUhzhDIGGgO78Zv?=
 =?iso-8859-1?Q?UFQyvfbAsj+vc7sTRRuG8ezrIBjyLTGFjK1aHnhUsqr/ljU6JC0sVOpBIF?=
 =?iso-8859-1?Q?Bp8LyW0vJoHcEg5wyEMMwTKor6qdRCsrj6m05PNMpIv/XPLYdN2M4Cwxtm?=
 =?iso-8859-1?Q?MGLMvR5IizvJEUv/nfPVnWkhS3riKDAy06xP6R8moocnWKFnXPJwgXSBhC?=
 =?iso-8859-1?Q?UJA+SD+cZrKjJqmVZ+Na+NMnPZTIBpRpiU6qhqi7bmtv8C/e2RXFFNPjJD?=
 =?iso-8859-1?Q?snRoATzZRJdmkfIKv1DEjAzv5I51AV+6+c+LqH27e5lOMo7C+LPxlE0m/Y?=
 =?iso-8859-1?Q?GyzrCcnq2GzHFZjAioPWCniFFzHH+LfXhFxmsrCMjsThtar37yjsJXc4Zy?=
 =?iso-8859-1?Q?JuhDvVEcRyKT6P1fklQyoXvrmTIzPca9nYYaZ5OiDD0+DeLAER0YyzymRK?=
 =?iso-8859-1?Q?HbFky0SxzOiz6Ji55yMfP97S/A9mPQTFtBELlKfJ/ztI0gAXD1hgFn8324?=
 =?iso-8859-1?Q?q/6Ikn4pCIVnsSPJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?e6wRsRhS7BpUC9gDokuvw4Wm+qDZ7NQ+YCWir8Rc8++fv//+8U5JoXhVwr?=
 =?iso-8859-1?Q?5175MWZJtDrdg6BuodfHYhJKiM7lRm3edLCPdKtH84okVqfaknxLPYqook?=
 =?iso-8859-1?Q?22bXZkhwS5IvM9w4fP8vF5cHpj8zvswU5Aam68LX6+yl52JPFYnmwF+ubQ?=
 =?iso-8859-1?Q?K3dP8dV01arp520m4clg2HqAmithY+ky022OT3rGp3PNn/qEh66X2Xpmej?=
 =?iso-8859-1?Q?lurPvXNFZ1NuaNfWDciIwpXSJmx8P6xEdiN7ITwfYEU0ibT8JhdiPbMv9B?=
 =?iso-8859-1?Q?4VT0fWZYf4TIa0veLcSnNNmCb0/9LMFdJ7dt3kWNZFVdWcFV7V7GTACfn8?=
 =?iso-8859-1?Q?B17AYIW6FygQLRvEi03ncP5FUfGBcOwfsv7Y193qFydxOjIGvQiZLbV37Z?=
 =?iso-8859-1?Q?lSemiftKsVxLLpvmvsfUq2nwvUmb1mpO4Xv3WQx4UTYaaHtdnEdGNsbAPB?=
 =?iso-8859-1?Q?f0ku8/zEBwHifbEKQIwrwF61+gTGm0tNktdlPKA992TYwgNkyPqyMFHzrt?=
 =?iso-8859-1?Q?ZFdbUKWHs46frtDJd1HWQ30WXQk9S+fltJ5UXbrgFZBkq73/hikwTp31QE?=
 =?iso-8859-1?Q?5xX/yGSJGnRnpecSaKYHVa73iVOr101/ZrA3LlopTx9vSUyKtEds8uQucz?=
 =?iso-8859-1?Q?VrO1gh68QzG950Pp0lj90lTIUxzSs78NgbhiAMKOspBEc0mUDJY9NOqvbL?=
 =?iso-8859-1?Q?2RcBAe8pH/+7dfumMqBjWfrnmTNeSgBW1C6kP7rlnaHb5OD4dEQKtkDl1o?=
 =?iso-8859-1?Q?LMjf7wqDAiixc8jOACkxsF2kMWeCDWZPypdHXpwQURqNZa0j/PPaJTnLFw?=
 =?iso-8859-1?Q?Me38R4unDoXnIVDfAdFXoCIwb70E4N5EMB+TkoRyLib1sWdjXTP7TdhY1X?=
 =?iso-8859-1?Q?PsYo/3mbqJAo/ZSlNJNF6+yyaMXlN6aHufu/WnOT0UujEcS6Ws22NshXz5?=
 =?iso-8859-1?Q?f+W+5fKJ8/tn1kpRsQ8VnfQYRZUE0W70skY8f+0d/UuBO/vjYaYCFwppyG?=
 =?iso-8859-1?Q?AUFjnvjrzUsUVCN80PHYvV27JRr/lMAqRm/+ymm4ZcxgWjlWCpjL97thPa?=
 =?iso-8859-1?Q?hYiGAOapCShtvliDTviNIV3b4Ge67il/BCJy0mbsbMG3cdMfjxKz5WLVe4?=
 =?iso-8859-1?Q?4bqZJHKESCaO+L+HEID6iMZOsjxoiTe84os5odpRgQuQH49gvVk84U+QGg?=
 =?iso-8859-1?Q?x8aPxWfmYJmoa5IwNeJkt6UBZQt4rp2lRTYBb0gYuVgOov3gcKoHFCm0AH?=
 =?iso-8859-1?Q?t/Qy5r4ZeO9tl4EmENX/QKag6iEDNHlijtp/gkvsfeMmXq1B5SUh/FyawT?=
 =?iso-8859-1?Q?lux0jSkd7DuLUhm3AlLfWPCWvS3Rc4ygBspZOEDt57iiIWVCZ73DqYMqM9?=
 =?iso-8859-1?Q?NSckk87H7oJhxP4c+/wbTJvJW+aDfDNeNLE9VeLbV+ImuCxRQr/QtIbo7J?=
 =?iso-8859-1?Q?LCX9lwZkNHz0e+0oMrG8zppANXpzz/XAt/sJgm0pY4gNMewl1SfJP+hRqW?=
 =?iso-8859-1?Q?isKeBE2tKfK+BlNVWNv3xehvBjhejYCIA4dRpxoPvud615TwxSEcozWNS4?=
 =?iso-8859-1?Q?+jnh5RvriMrDTxwHtLQrYrFLEKCFyEzWWUDFzgkkkVcQqzqMV5zXRvuT02?=
 =?iso-8859-1?Q?YUGKOlPNZ6iD4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6fb52c-751e-4e33-d3fc-08dd45fe02a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:59:02.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s46uKaXmvpJ73zjYhtBXMzE3OH2RNGCvn4RHkX/BrxVVRLdgPFNdNxxMazlAN5/OTDiZ7hrEaPNco73Xr8Vjbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6938

On Wed, Feb 05, 2025 at 06:30:49AM +0000, Joshua Yeong wrote:
> On 04-Feb-2025 11:38 PM, Frank Li wrote:
> > On Tue, Feb 04, 2025 at 03:17:36AM +0000, Joshua Yeong wrote:
> >> Hi Frank,
> >>
> >> On 03-Feb-2025 11:52 PM, Frank Li wrote:
> >>> On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> >>>> Hi Mukesh and Frank,
> >>>>
> >>>> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> >>>>> Hi Frank,
> >>>>>
> >>>>> On 1/30/2025 1:35 AM, Frank Li wrote:
> >>>>>> I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
> >>>>>> API i3c_device_do_priv_xfers_mode(). The existing
> >>>>>> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
> >>>>>> to maintain backward compatibility.
> >>>>>>
> >>>>>> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
> >>>>>> with 'rnw' since HDR mode relies on read/write commands instead of the
> >>>>>> 'rnw' bit in the address as in SDR mode.
> >>>>>>
> >>>>>> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
> >>>>>> is not implemented, fallback to SDR mode using the existing priv_xfers
> >>>>>> callback.
> >>>>>>
> >>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >>>>>> ---
> >>>>>> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
> >>>>>> one i3c transfer. for example, can't send a HDR follow one SDR between
> >>>>>> START and STOP.
> >>>>>>
> >>>>> Is it wise to add two function inside main funcion and separate SDR vs HDR ? so we don't need to change current function arguments.
> >>>
> >>> I am not sure if understand your means. HDR have difference mode, anyway
> >>> need add new argument.
> >>>
> >>>>
> >>>> I think the 'private transfers' are limited to SDR communications,
> >>>> would it be better if we have a different interface/naming for hdr transfers?
> >>>
> >>> The key is what's difference between hdr and private transfers. So far only
> >>> command vs rnw, any other differences I missed?
> >>
> >> I guess mainly the terminology. The specification differentiate HDR from private transfer.
> >> We can have the hdr interface to have length indicating for u16 rather than u8 in private trasnfer.
> >
> > It should be equivalence with check length is even.
> >
> > The key is how client driver will easy to use HDR if they already have SDR
> > support.
> >
> > suppose client:
> >
> > struct i3c_priv_xfer xfer[2] = {{ .rnw = 0, buf=p1, size = 4, addr=0xb },
> > 				{ .rnw = 1, buf=p2, size = 4, addr=0xb }}
> >
> > priv_xfer(..., xfer, 2};
> >
> > if support HDR
> >
> > if (hdr) {
> > 	xfer[0].cmd = 0x80;
> > 	xfer[1].cmd = 0x;
> > 	priv_xfer(..., xfer, 2, HDR);
> > } else {
> > 	priv_xfer(..., xfer, 2, SDR);
> > }
> >
> > client driver needn't distingiush if buff is u8* or u16*.
> >
>
> I fine with the overall structure `.rnw`, `buf`, `size` and `addr`.
>
> I prefer if we could use `hdr_xfer` rather than `priv_xfer` for HDR transfer and we can have
> distinguish mode for DDR/TSP/TSL/BT. In case we are supporting for ML in the future

what's means of "ML"?

> we dont have to lump the function into `priv_xfer`, and we can go `ml_xfer` instead.

Actually, you suggest, rename 'i3c_device_do_priv_xfers_mode' to
'i3c_device_ml_xfer'?

>
> The issue with length indicating both u8 and u16 here is that we would get confuse how the
> buffer length is interpreted, when length is 1 does it mean 2 bytes or 1 byte? Splitting HDR
> interface will ensure that length always indicate u16.

All data transfers should be defined in terms of bytes or block units. Note
that QSPI DDR mode faces a similar constraint, supporting only even-length
transfers. In most systems, alignment requirements are used to indicate
size constraints:

SDR mode: Alignment is 1 byte.
HDR mode: Alignment is 2 bytes.

When using DMA without a bounce buffer, the alignment must match the cache
line size. Changing to a u16 type does not provide enough flexibility.
Instead, I propose using a void* (or u8*) for the buffer and a byte count
for the size. This approach allows for more extensible alignment
requirements and better compatibility with other transfer systems, such as
SPI and PCIe.

Frank
>
> Joshua
>
>
> >> I think the framework should check if device whether it supports HDR command before sending it.
> >> I have code here that do some handling on that.
> >
> > Yes, I can add such check. The key point is API design.
> >
> > Frank
> >>
> >>>
> >>>>
> >>>>>> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
> >>>>>> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
> >>>>>> instead put into a big i3c_priv_xfer[n].
> >>>>>> ---
> >>>>>>   drivers/i3c/device.c       | 19 +++++++++++++------
> >>>>>>   drivers/i3c/internals.h    |  2 +-
> >>>>>>   drivers/i3c/master.c       |  8 +++++++-
> >>>>>>   include/linux/i3c/device.h | 12 +++++++++++-
> >>>>>>   include/linux/i3c/master.h |  3 +++
> >>>>>>   5 files changed, 35 insertions(+), 9 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> >>>>>> index e80e487569146..e3db3a6a9e4f6 100644
> >>>>>> --- a/drivers/i3c/device.c
> >>>>>> +++ b/drivers/i3c/device.c
> >>>>>> @@ -15,12 +15,13 @@
> >>>>>>   #include "internals.h"
> >>>>>>     /**
> >>>>>> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
> >>>>>> - *                specific device
> >>>>>> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
> >>>>>> + *                     specific device
> >>>>>>    *
> >>>>>>    * @dev: device with which the transfers should be done
> >>>>>>    * @xfers: array of transfers
> >>>>>>    * @nxfers: number of transfers
> >>>>>> + * @mode: transfer mode
> >>>>>>    *
> >>>>>>    * Initiate one or several private SDR transfers with @dev.
> >>>>>>    *
> >>>>>> @@ -32,9 +33,9 @@
> >>>>>>    *            driver needs to resend the 'xfers' some time later.
> >>>>>>    *            See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
> >>>>>>    */
> >>>>>> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>>>>> -                 struct i3c_priv_xfer *xfers,
> >>>>>> -                 int nxfers)
> >>>>>> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >>>>>> +                  struct i3c_priv_xfer *xfers,
> >>>>>> +                  int nxfers, enum i3c_hdr_mode mode)
> >>>>> why can't we pass mode as another structure member inside struct i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
> >>>
> >>> If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actually,
> >>> I3C can't do that.  we assume finish whole xfers between one whole traction
> >>> (between START and STOP).
> >>>
> >>> Frank
> >>
> >> Yes, I think it is better if we split xfer transfer interface for SDR and HDR.
> >> The interface should assume respective driver to decide how to handle ENTHDR CCC + Exit Pattern.
> >> Else we will need additional 2 interface for start and stop for HDR.
> >>
> >> Joshua
> >>
> >>
> >>>>>>   {
> >>>>>>       int ret, i;
> >>>>>>   @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>>>>>       }
> >>>>>>         i3c_bus_normaluse_lock(dev->bus);
> >>>>>> -    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> >>>>>> +    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
> >>>>>>       i3c_bus_normaluse_unlock(dev->bus);
> >>>>>>         return ret;
> >>>>>>   }
> >>>>>> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> >>>>>> +
> >>>>>> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
> >>>>>> +{
> >>>>>> +    return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
> >>>>>> +}
> >>>>>>   EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> >>>>>>     /**
> >>>>>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> >>>>>> index 433f6088b7cec..553edc9846ac0 100644
> >>>>>> --- a/drivers/i3c/internals.h
> >>>>>> +++ b/drivers/i3c/internals.h
> >>>>>> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> >>>>>>   int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> >>>>>>   int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>>>>>                    struct i3c_priv_xfer *xfers,
> >>>>>> -                 int nxfers);
> >>>>>> +                 int nxfers, enum i3c_hdr_mode mode);
> >>>>>>   int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
> >>>>>>   int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> >>>>>>   int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> >>>>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >>>>>> index d5dc4180afbcf..67aaba0a38db2 100644
> >>>>>> --- a/drivers/i3c/master.c
> >>>>>> +++ b/drivers/i3c/master.c
> >>>>>> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
> >>>>>>     int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>>>>>                    struct i3c_priv_xfer *xfers,
> >>>>>> -                 int nxfers)
> >>>>>> +                 int nxfers, enum i3c_hdr_mode mode)
> >>>>>>   {
> >>>>>>       struct i3c_master_controller *master;
> >>>>>>   @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>>>>>       if (!master || !xfers)
> >>>>>>           return -EINVAL;
> >>>>>>   +    if (master->ops->priv_xfers_mode)
> >>>>>> +        return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
> >>>>>> +
> >>>>>>       if (!master->ops->priv_xfers)
> >>>>>>           return -ENOTSUPP;
> >>>>>>   +    if (mode != I3C_SDR)
> >>>>>> +        return -EINVAL;
> >>>>>> +
> >>>>>>       return master->ops->priv_xfers(dev, xfers, nxfers);
> >>>>>>   }
> >>>>>>   diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> >>>>>> index b674f64d0822e..7ce70d0967e27 100644
> >>>>>> --- a/include/linux/i3c/device.h
> >>>>>> +++ b/include/linux/i3c/device.h
> >>>>>> @@ -40,11 +40,13 @@ enum i3c_error_code {
> >>>>>>     /**
> >>>>>>    * enum i3c_hdr_mode - HDR mode ids
> >>>>>> + * @I3C_SDR: SDR mode (NOT HDR mode)
> >>>>>>    * @I3C_HDR_DDR: DDR mode
> >>>>>>    * @I3C_HDR_TSP: TSP mode
> >>>>>>    * @I3C_HDR_TSL: TSL mode
> >>>>>>    */
> >>>>>>   enum i3c_hdr_mode {
> >>>>>> +    I3C_SDR,
> >>>>>>       I3C_HDR_DDR,
> >>>>>>       I3C_HDR_TSP,
> >>>>>>       I3C_HDR_TSL,
> >>>>>> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> >>>>>>   /**
> >>>>>>    * struct i3c_priv_xfer - I3C SDR private transfer
> >>>>>>    * @rnw: encodes the transfer direction. true for a read, false for a write
> >>>>>> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
> >>>>>>    * @len: transfer length in bytes of the transfer
> >>>>>>    * @actual_len: actual length in bytes are transferred by the controller
> >>>>>>    * @data: input/output buffer
> >>>>>> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> >>>>>>    * @err: I3C error code
> >>>>>>    */
> >>>>>>   struct i3c_priv_xfer {
> >>>>>> -    u8 rnw;
> >>>>>> +    union {
> >>>>>> +        u8 rnw;
> >>>>>> +        u8 cmd;
> >>>>>> +    };
> >>>>>>       u16 len;
> >>>>>>       u16 actual_len;
> >>>>>>       union {
> >>>>>> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>>>>>                    struct i3c_priv_xfer *xfers,
> >>>>>>                    int nxfers);
> >>>>>>   +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >>>>>> +                  struct i3c_priv_xfer *xfers,
> >>>>>> +                  int nxfers, enum i3c_hdr_mode mode);
> >>>>>> +
> >>>>>>   int i3c_device_do_setdasa(struct i3c_device *dev);
> >>>>>>     void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
> >>>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >>>>>> index 12d532b012c5a..352bd41139569 100644
> >>>>>> --- a/include/linux/i3c/master.h
> >>>>>> +++ b/include/linux/i3c/master.h
> >>>>>> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> >>>>>>       int (*priv_xfers)(struct i3c_dev_desc *dev,
> >>>>>>                 struct i3c_priv_xfer *xfers,
> >>>>>>                 int nxfers);
> >>>>>> +    int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> >>>>>> +                   struct i3c_priv_xfer *xfers,
> >>>>>> +                   int nxfers, enum i3c_hdr_mode mode);
> >>>>>>       int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
> >>>>>>       void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> >>>>>>       int (*i2c_xfers)(struct i2c_dev_desc *dev,
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
