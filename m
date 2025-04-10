Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF1290BC5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318390; cv=fail; b=lzTK7e61y05v8FQKWOd6Org27cUEf0Ku9Io9px/gSDWDNID/3X/oREVVGRBGazVV1TQ0gt+Vc8Nsy2eSGuromhpM8Z27jXbfOPrpnlSU/b6VRngfsIlmAaO0jlv5sE517HuKPaZTY7/As7rQLxWO3D0m2z1upawRcckuoh2IaFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318390; c=relaxed/simple;
	bh=G09hk3fM6Zb4wTIVHvc5t4f8qaB8l3Ruptbllo9rwpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SlNb6YVdPZen6xxrbPVF4wj/Eo8FTGA262wE9eY9Xk9hs3u2JVHwVLTIz4SiEuXx6eEcjjM7HNvg/76oW2claulIL0BbtbcCCdPPJHUlxT4BgAV7mhqGRNF4qhkrqB75TwIF517W3pMLZeG2ese+NbwsQxPc6Lc62sQncPErLuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHY8BLcR; arc=fail smtp.client-ip=40.107.21.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHY8BLcR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVQD81pQna7KNDBpU8Avz8teLsJmKE3vgVGZjDScC2gsyX/Vd1uvz2BFBDJxYpY6FIK5ynqF9A+CWk43/ALgjNfAsDmuPBvW474cbcPQ/bYFrRRZ7jcUxhGaRbSnKuxHVL8o1q/EaYZCq7Hhv3wvCwLbjWvDEDwxnZiEzqMWZyahPI+Z0U/29cHXQCbkP5A2iwgraPYsALih57fezpPa3C1R2ytWp611+wGIARAbcTUUCb+vo1GbOcQC0R2OYNqgyQfesw7BHuxd/IT55Agw3lMqztVVoa8yhBhizVTfBQ3tRcqnIS4OJJWJNG2EIb6CAQ9vPDhriPhd4qREZW7ecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnHYaQCQqHDgM/v5IbVtVQvZf7W4i67hU2RULv/Z8kA=;
 b=ICblXWJJ+kKwVasVN0bIhU56QJCW3xzaG5Hy8LFh06Kw0G4rmWlYaFHXpOWY2ZLbCR9LTwb6GtvSSGEM9+llk4plmnrwK0+93SkU23Nnsj2w1SxYip076Mp/EDF1Hy7QKS+quxLU5KqjwrvWs37w3tfIHOU5azZ3aEDGQYaQcw6MpsIpApute8QJAz444odKxPo8KigoYXH7hFcK1EsFSYljKDET0TJAYCGjHJxgp26WeqwRnH95Dr3cUSXXo5KkBYA3kwkvKGFigtTJR3YeJx27JcV3RxLqiQGpFF4CHwQLmVXBUpIMcIYvhELZ0QdbDuQPZyTYLRMNOSzMJohARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnHYaQCQqHDgM/v5IbVtVQvZf7W4i67hU2RULv/Z8kA=;
 b=iHY8BLcRRyCgSfshkbfnywkXrvyIpL6EatiejLAAqkQWoXnA3XNnPkvtUJDKZpFawWs3Ikxlqc0GOySHB/u7U/jOQ0fFUe8eVxHnD6CacFfACbaUKKsJj3adiMuIm1Pdls0/WgUXimJ+FQi6MWnE6ymx1+fmuZkjkwZrEoD5mgvX7Cvm/eogtbepYyALrAyiu34EsK4X0xiSnGwEe8wWXG4Ia2UmBdNtHbiXKiKItJL1UGzEiwzRYOSsNYv8cFYn+9/BelytSb1jKMwpjXsMx2YJvFhdwpieV+ajfQCoI8SFCboSMIxziGmZlVZVEjl2qAv2fSrwyVz2JuoAanRTVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS4PR04MB9552.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 20:53:04 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 20:53:04 +0000
Date: Thu, 10 Apr 2025 23:53:01 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>, sean.anderson@seco.com,
	bigeasy@linutronix.de, horia.geanta@nxp.com,
	madalin.bucur@oss.nxp.com, hristophe.leroy@csgroup.eu,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: include/soc/fsl/qman.h:383:4: warning: field context_a within
 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <20250410205301.wkb7rkbbtdjgzti5@skbuf>
References: <202504091657.OgPuMa8C-lkp@intel.com>
 <Z/ZXbElRLBsJcc1X@gmail.com>
 <20250409120138.f5oingawrurwq7ep@skbuf>
 <Z/e7p53g/e0wNYF+@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/e7p53g/e0wNYF+@gmail.com>
X-ClientProxiedBy: VI1P195CA0044.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::33) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS4PR04MB9552:EE_
X-MS-Office365-Filtering-Correlation-Id: 537447e8-a055-4ff5-42b0-08dd7871b03d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?RhfyLM11if+GhTAG+M0K8kKwNTeZJc2FkZHIBmasg25St9AwMP52wP0hSucR?=
 =?us-ascii?Q?T/x0uC2GEOlIVQ8vGWOCIYpihPGhpwBVxUJ6C1cbvr3EzeJSNQs3m6pgvO88?=
 =?us-ascii?Q?VOCPmlJsvD8u7ArNFbi0fMEBcDzFAXfWqmAqTR58Yf8ZW3lMKw/Y/z46ecqi?=
 =?us-ascii?Q?f5n5l+dCzozS89cXsbnUDIp+xSjbTha3ZI0CHmHoJ1TMtVRopDK8NQhUnLi+?=
 =?us-ascii?Q?0QnpaAar3X7/i5Ij1gDi9axloYy//rRso0z9xI5CaBmGBftqS13JuFqdmwzG?=
 =?us-ascii?Q?2P5aZUBPH1rCjnsw3QkUBlNJ9YjEXihAjQZ3rEAISA9TSAPx4XlEVurq0/i/?=
 =?us-ascii?Q?YlOQwU+R5ehsVwT0qJQA81vGSGB6O/0MPeFTX+M9osJO6kAgcr7V/h0mRD3l?=
 =?us-ascii?Q?+P9CsjEAjAxaZT/Wcd+SNq+dh6o1ZrPChFwsAizMhn/MsM3+wcNAop2emPFC?=
 =?us-ascii?Q?gxxJGdwr9UJFo0hrQpfHPq+JZeiUzPGR0SQhUf2eKRoCzWlRajd+NniuxXHD?=
 =?us-ascii?Q?cu6EZWwK0LuNrreKbf4eHQTwM0I7pqV3/95uFqtpq1CITNhIKn+xshdds7Q1?=
 =?us-ascii?Q?9BNgLo+6n+TcWl3pnaMtZ8VMhQfRGC0rRBvTdQHNZe5wDx/PL2sBvIFW2x6v?=
 =?us-ascii?Q?oVJkSQI4sgDPCbYsf/XrbpBHeWCMPRYaX0w0U6EVkeTGh3hxDts4qyp9KYYE?=
 =?us-ascii?Q?9ruHb7z1uq8oMYiWRt180DnyiNdRLWP65RWibUTmFivPHLcb8Ppo6ri+awFO?=
 =?us-ascii?Q?XmHPYVNUj6lz2Z9lGAOQV+2aPjB1IwjhIGVzEzHAPg3GqHy3HDOXbbwL8pNn?=
 =?us-ascii?Q?lUnZGTkC0HgDMwCthSIx/oWfyPaKjOUaNzlbZ/NXBS0d7zDGlP8lhL2B1l5V?=
 =?us-ascii?Q?Pxh8yNCz66l8Hq/t7M/x/fQCFwt6orW5GMIQIOn4yGCsapf2gG95dX6cFgNl?=
 =?us-ascii?Q?TJIi8PQrL4974Cpl9AUl1dHksETVYPtnKgbqEgWHe52NC192qeOHcCSBB++B?=
 =?us-ascii?Q?RjVPwHjU1PXiG9aEHSzbPegf/eSDoW1vRdpMAJXC9YTDt9adtaLYgTm0SLwL?=
 =?us-ascii?Q?PYGGRPx2GTLXJ96JgXFygON4YdYqwqL61r2pnN5q03trnDW1EppBJ341BPau?=
 =?us-ascii?Q?vI8jRrOmGOVE7vPzir5oQZilT3NIVIUkSqI59BRq77axkx8JeyJEdZbtL2kj?=
 =?us-ascii?Q?0pBe25/4QvNQyfRNZDi1DFIkaHw0tfvw8POhwzbA42ZL0k+ci3ceqmI8t8Vm?=
 =?us-ascii?Q?sWlPDyEjdH3BqbaN9gSsJbWxvLiiQYMZUYakHyLuNO3WZsj+TueLxMi6OGft?=
 =?us-ascii?Q?wb0roiwWFRPttTp+PlWlIRYu49HiR3YW/Rx5pkKR5HE1J58fJKt3A5oHfRmk?=
 =?us-ascii?Q?1ScFJ/wVFTQVMDOfPMva2ltAnX2EhZE/b7O0FL8Wz5ge1sNtzzWb3Y5s4dj2?=
 =?us-ascii?Q?gVBFXt2AWt4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?iudOJMqjTcnRRr77K0ShgLysMBIHjbqOsesynXGvGtcs0qvGbNRKrIR7OzQk?=
 =?us-ascii?Q?YUAt9XnYCGi0UtMfv0tGWw9eplPqnIY7U7r4re4Kg1NcPUxLT1PI5GnoxiVH?=
 =?us-ascii?Q?TiXPvYV8gqT5LqQPTHLtahW2zANSmOwVCAzFaDVmg+vDmsm9CE2XAIBH4Egp?=
 =?us-ascii?Q?hpjHplCnfXESjM8b4lmYB8i3tzvyoP6GFYj8yLa9t4W8EmdH8bFk+FZrp8QE?=
 =?us-ascii?Q?dDuBymzThzFuRy7EC1O1Pq3z8Sg4Si+V9c9LUip10eXu3snH9zx3R8TPaJfc?=
 =?us-ascii?Q?O+DAa9y8Uf1jc+paJ/zNoBTnsXlKEPud+zKoQL33XIUL7FgzgIzcXcU1GJO6?=
 =?us-ascii?Q?eXL+EyC2vVHRP7GuWCygi+36ZMAhTQvx8Wsh5LfU4P6UR219GrtxgS81HNKv?=
 =?us-ascii?Q?p5tn0bxIJms+eFXgnpWqf0fperxlC8B9pYPJgNGTTzMrnlqG/e5cW7KRZrM/?=
 =?us-ascii?Q?CHGMo3O3Oz0Bejw52UEBvjRcnZkbAXtRmwTqcgaoCk6hI3iUkIsGkTKJ9HkU?=
 =?us-ascii?Q?9MYm3BkCnkNUmw3vcqTif9TvF+Wxjd2DLbmajeZSDCotJZ8yEwQ0lcZHuNXF?=
 =?us-ascii?Q?ku5J7HARYVvnY1Z6huZMWcWplIILw7g5ovJV9Bvhr2yG9N9pZLduoIzQzKpL?=
 =?us-ascii?Q?zaZSGaRg6wyytBRySzfl+RQTwGjAJ2ao8TwKENeJICABAHiOlDAXONcfihxH?=
 =?us-ascii?Q?GAw1WgN7TPXrxmm+Vyq1aAusJoTsrWsQ+6jv1BEKSWBN8dBAOHxMKd5U40x5?=
 =?us-ascii?Q?0cOsZmx5iEwKa+pswoM/qbE3WESNELhMw4REHkTCKsmT5+lbQZvuYGmLFDKo?=
 =?us-ascii?Q?shTbQg00W9RMjEiqUzfKa9cepbNCLa+/tPnguy+SMOz4PSQ51qUGjRo4jeDr?=
 =?us-ascii?Q?RddvZSQnEeEeqQhpTF1MCqZuZbiE9tIDn7ybZXN69vMv7fKCgLJ0YxqbuEvw?=
 =?us-ascii?Q?hvD0SzL1L3+vs0mYnlbdsF1zCNZpZrqAuJJX24rZF4qcW8FqpnvKnzfSbmv7?=
 =?us-ascii?Q?/n9Mxm4BOJxCQjLOeOTZNHKvAHazWO+kIiEV4iK5VWsJb/qfTP3QKuaSKAFy?=
 =?us-ascii?Q?hgCKlq03JmVbZVQhLe3VY6IMKoJnrUPW6oZ9nbeoijSyZnx1SvxsZ0bFBNNX?=
 =?us-ascii?Q?YNggOS356v4ZDQBpvTogGp5ML3FL0JrOXLtsQ6n4+cQFtntjO5c7Bw8+2qh8?=
 =?us-ascii?Q?6uvbKUs8Lj0VeIL53Em2Hq7pBA1Q0vHXJA56TJTvG6WQtYSCpVldRhbQxklP?=
 =?us-ascii?Q?8RgmjET276nMsn+BHnT0/yvFGLO1GPplanx+TFqxZ+comRnHE57cDgZqKXaO?=
 =?us-ascii?Q?/dqocmDwFfWKHUERXzIYULOgvBnHKMNg5YBgd9or+ZVR8Z6jW5pyULAESEvx?=
 =?us-ascii?Q?9YgxUZBN3jOjW3Vt+9QIK15QuFEIGP2j6uFPboRjH3Tmttcwss/QYqVeT9K6?=
 =?us-ascii?Q?pekUaO1hUI5bH/hAz/TjANGkbqXAC60bRnfNyVLb/pduEtAoqR9A8qEm1g1s?=
 =?us-ascii?Q?g++HtKxb846oOyvdHaq+Ozom5PNB2rHY+jndFka2p4hDxQm885XuyxMhtuKp?=
 =?us-ascii?Q?lmopV+BjyRMDF0L+DP5EsFBli3KJ3Dw8NsYNKxnw0Hb5+6+Gnx8gokiZQ83W?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537447e8-a055-4ff5-42b0-08dd7871b03d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:53:04.2008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NDce7NJB26YvwTzIM2R4Qzaz8RN2p1td80vqxICfrZkNv/HvV5quyAZIlqv3eDpQATH3IXhlU5UmGoeZzx5bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9552

On Thu, Apr 10, 2025 at 05:37:59AM -0700, Breno Leitao wrote:
> On Wed, Apr 09, 2025 at 03:01:38PM +0300, Vladimir Oltean wrote:
> > Hi Breno,
> > 
> > On Wed, Apr 09, 2025 at 04:18:04AM -0700, Breno Leitao wrote:
> > > On Wed, Apr 09, 2025 at 04:55:16PM +0800, kernel test robot wrote:
> > > > >> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
> > > >            } context_a;
> > > 
> > > <snip>
> > > 
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  346  
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  347  struct qm_fqd {
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  348  	/* _res[6-7], orprws[3-5], oa[2], olws[0-1] */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  349  	u8 orpc;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  350  	u8 cgid;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  351  	__be16 fq_ctrl;	/* See QM_FQCTRL_<...> */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  352  	__be16 dest_wq;	/* channel[3-15], wq[0-2] */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  353  	__be16 ics_cred; /* 15-bit */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  354  	/*
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  355  	 * For "Initialize Frame Queue" commands, the write-enable mask
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  356  	 * determines whether 'td' or 'oac_init' is observed. For query
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  357  	 * commands, this field is always 'td', and 'oac_query' (below) reflects
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  358  	 * the Overhead ACcounting values.
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  359  	 */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  360  	union {
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  361  		__be16 td; /* "Taildrop": _res[13-15], mant[5-12], exp[0-4] */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  362  		struct qm_fqd_oac oac_init;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  363  	};
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  364  	__be32 context_b;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  365  	union {
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  366  		/* Treat it as 64-bit opaque */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  367  		__be64 opaque;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  368  		struct {
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  369  			__be32 hi;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  370  			__be32 lo;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  371  		};
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  372  		/* Treat it as s/w portal stashing config */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  373  		/* see "FQD Context_A field used for [...]" */
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  374  		struct {
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  375  			struct qm_fqd_stashing stashing;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  376  			/*
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  377  			 * 48-bit address of FQ context to
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  378  			 * stash, must be cacheline-aligned
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  379  			 */
> > > 
> > > Looking at pahole, I am not sure this is caacheline-aligned, as
> > > suggested above.
> > > 
> > > 	# pahole -C qm_fqd
> > > 	struct qm_fqd {
> > > 		u8                         orpc;                 /*     0     1 */
> > > 		u8                         cgid;                 /*     1     1 */
> > > 		__be16                     fq_ctrl;              /*     2     2 */
> > > 		__be16                     dest_wq;              /*     4     2 */
> > > 		__be16                     ics_cred;             /*     6     2 */
> > > 		union {
> > > 			__be16             td;                   /*     8     2 */
> > > 			struct qm_fqd_oac  oac_init;             /*     8     2 */
> > > 		};                                               /*     8     2 */
> > > 		__be32                     context_b;            /*    10     4 */
> > > 		union {
> > > 			__be64             opaque;               /*    14     8 */
> > > 			struct {
> > > 				__be32     hi;                   /*    14     4 */
> > > 				__be32     lo;                   /*    18     4 */
> > > 			};                                       /*    14     8 */
> > > 			struct {
> > > 				struct qm_fqd_stashing stashing; /*    14     2 */
> > > 				__be16     context_hi;           /*    16     2 */
> > > 				__be32     context_lo;           /*    18     4 */
> > > 			};                                       /*    14     8 */
> > > 		} context_a;                                     /*    14     8 */
> > > 		struct qm_fqd_oac          oac_query;            /*    22     2 */
> > > 
> > > 		/* size: 24, cachelines: 1, members: 9 */
> > > 		/* last cacheline: 24 bytes */
> > > 	} __attribute__((__packed__));
> > > 
> > > 
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  380  			__be16 context_hi;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  381  			__be32 context_lo;
> > > > c535e923bb97a4 Claudiu Manoil 2016-09-22  382  		} __packed;
> > > 
> > > I am wondering if we should use __attribute__((aligned(8))) instead of
> > > __packed, according to the document above.
> > 
> > Since you've replied, could you please help me also understand the issue?
> > It says "field context_a within 'struct qm_fqd' is less aligned than
> > 'union (unnamed union at include/soc/fsl/qman.h:365:2)'", but at line 365,
> > the unnamed union _is_ field context_a, no? What is it saying?
> > 
> > I _suspect_, but I'm not sure, that it's complaining about context_a.opaque
> > being a 64-bit field which is not aligned to a 64-bit boundary. Though
> > I'm not getting that from reading the description.
> 
> In fact, the whole union is not aligned, and because "struct qm_fqd" is
> also packed, it cannot add a padding before the union (which would be
> the compiler decision,  since the union contains a packed field).
> 
> > But struct qm_fqd is embedded in other structures, and the alignment
> > of the fields changes in that case. I think that context_a.opaque is
> > 64-bit aligned in all cases.
> 
> I don't think it is ever aligned. Check the pahole above, and the union
> starts at byte 14th, which is not aligned if my math is correct.
> 
> --breno

When it's part of struct qm_mcc_initfq or struct qm_mcr_queryfq, it's
actually aligned properly, because the outer structures (QMan management
commands) offer that alignment. It's ok to not add padding, you still
want to talk to the QMan properly...

The problem might be its standalone use, qpool_cleanup() and cgr_cleanup(),
where we give a pointer to an on-stack "fqd" variable to qman_query_fq(),
and we expect it to do the following copy:
	*fqd = mcr->queryfq.fqd;
with "*fqd" being unaligned and mcr->queryfq.fqd being aligned.

At least on arm64, I see the code decompiles to the following.

		*fqd = mcr->queryfq.fqd;
    1d84: f841a109     	ldur	x9, [x8, #0x1a]
    1d88: f841210a     	ldur	x10, [x8, #0x12]
    1d8c: f840a108     	ldur	x8, [x8, #0xa]
    1d90: a900a66a     	stp	x10, x9, [x19, #0x8]
    1d94: f9000268     	str	x8, [x19]

Three 64-bit "load unscaled register" instructions to read
mcr->queryfq.fqd, and two instructions (store pair, store register) to
write to *fqd. So it's not doing the transfer field by field, and not
dereferencing the unaligned fqd.context_a in that process.

In fact, nowhere does the code seem to be dereferencing the 64-bit context_a.opaque,
so that can in principle be removed if that is a problem.

The code paths that dereference context_a through other mechanisms are:

qm_fqd_stashing_set64() - goes through the 16-bit context_hi and 32-bit context_lo
- used by qman_init_fq()

qm_fqd_context_a_set64() - goes through the 32-bit hi and 32-bit lo, used by:
- dpaa_fq_init()
- create_caam_req_fq()

qm_fqd_set_stashing() - goes through the struct qm_fqd_stashing that is
                        16 bits in size, used by:
- dpaa_fq_init()
- init_handler() in drivers/soc/fsl/qbman/qman_test_stash.c
- alloc_rsp_fq_cpu() in drivers/crypto/caam/qi.c

All of the above functions operate on the fqd structure embedded within
struct qm_mcc_initfq initfq, therefore prepend 10 more bytes and see how
that makes things properly aligned.

I'm not seeing alignment issues in actual use, and I still don't
understand exactly what the compiler is saying.
