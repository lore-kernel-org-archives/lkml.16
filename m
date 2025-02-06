Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2078.outbound.protection.outlook.com [40.107.249.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B01E5B77
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855975; cv=fail; b=D2PqMG55PfVdKTIAn1kCe2pBf2yCVpihzZ2xFVNNVDA/xXrVSRQs6jZF61ex2yA68Zni0ot1iaugRgellwgZAX1bydQjJPyNcOZEe8oqhLmsT/bfgOZEBUsYZu09KXENtK4aPw3PJyZ03a1XO0P7zm+QWl0zrLMYr7adjp/CZdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855975; c=relaxed/simple;
	bh=l4UTZB5rTqFQVJSNnflSvCareluDmggwkAnfcMXlGUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uKR6H9IGEZV4XYkfEDfjZfbcHy7pBDnXuoZVSMSZI/iV9bfw4DNho6qvH65R/O/wbZ7/nlVNFXFjLgCi0XQTgwL+rfVlpZGsOxQ4FgY+mcLowLPb1Sjt2C248JOJQ2xb6OGnnhkzPuSELf/MLXUv36opkNOgvCtQmRxWNK/5stQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E9+MfyHD reason="signature verification failed"; arc=fail smtp.client-ip=40.107.249.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E9+MfyHD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nbii+HrmDHfuQ2ksPIHNtO0cBmHEylYSsDy5fQ5Sf+Ay88ch3exBbi4BNKHIWa20UA/v6banXnzj42ilzwDL+oKgDJHJvM68zNoTayr4vYMjGU5QmCNPXmAEH84lTnd86j5ulwwoIv09MgJViNTAwCHDse/RJSnsC5/fUe90i5XEUFE8FPJfm7+kSJgrnotGZf72YcGpHsBTw37i7PgF9gdAfr/vzvPLedoKTNZ2Cg5rlhjQFnU/EEJP8NCVzC22Pn3a9UR51+rho+YOLZvYyfSNa3t7/oTJtvO6COJJH46cUxIa9tOImhM/Jv4b0iu2dxAuAdfAW+csRZDRm/4AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxwDQmfYj6RBu9CaqCyv03GOFq2onRd0E6iu0pBnRFQ=;
 b=TfoRyWEveTjOQ6PqYMReLW54S8m0Zdunc9P5bn0aqrkodILBflrYGLCwTsKJEfEIrdpKcSaqgOk3ppb5ldB0jPj17Dezu6lEl1u8qovbf2kmn/3Ltj1nhmEw1F8HvrqDgmiOKzlNQyl42kLFEaxokf/2+GUZjkvoDsHmI9MrTf6EzGy98kx0GYtI4NOiscM4Lt8jEcy1OBqfba/Pdqru/KI23BveFW3Qg+pN5rbicD55xFgqlFxT4Vz44PkS5de1VP1JSX5bx4KAHuGTIj8de3+6Wxwr7h6nfy/9MG3TofRjluvEwCNWk0xb/VURjcVDCL5m2Nb4dBOVQX8icIylMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxwDQmfYj6RBu9CaqCyv03GOFq2onRd0E6iu0pBnRFQ=;
 b=E9+MfyHDIpyZf9fKiX4FIHuiVG2Dpp7zN55TDYEeXmYUD0ocS9R8QubkbVsaSBRO/O/YyW5jNuSsUGUpagM5Dj9nwRtpJw0etH9qKS+I7FkU/tn9u1dNNavYRrDd3LeNexsFQV4Z0QUfGpmYgpvxKJo6GJJJPoI07Pktvv3AVtwLNeOv9nP5/qQ1a7SCY53/5DvucNm5Mj91kffg8ygAYJqbOxstlHXRq540MDajZue5zGOVYLMdkaTYt8XfgtCvivw3VOYXDTYCnV2I7s6ltNchk7S/ZlgM0enB0q1NUlSfozfIqyna2HDTHKRmAgBH3Zm81bA/gGaVIIY3OKdt9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 15:32:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 15:32:49 +0000
Date: Thu, 6 Feb 2025 10:32:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6TWGOrZULdNpsah@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <08098961-ab40-4bdf-af56-c77a24c55959@quicinc.com>
 <Z6I1jBx273o5GE5w@lizhi-Precision-Tower-5810>
 <0435e96d-6786-4adc-83eb-a6aa3766c2d5@quicinc.com>
 <Z6OHSsISZPClbRxw@lizhi-Precision-Tower-5810>
 <7ba5acb0-be7d-492f-9f86-bb76c927437c@quicinc.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ba5acb0-be7d-492f-9f86-bb76c927437c@quicinc.com>
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9ee281-2558-4783-b66d-08dd46c382d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Fzfot2q2JggUQZQepkeaE/pPKo3xGHmA6K6D/LyS0faol45GOGMtffj4SX?=
 =?iso-8859-1?Q?UP5fSm6wtBbA11v9IPCEJ4k4kMnjBYr1mvUJJuG4Q2wYLJ3OZ9pE2oZ0OI?=
 =?iso-8859-1?Q?I4/fQwIK5SsllxKoplrs8KOAih3Z45YEHc6iejEWS2bJA8KmVsxJeBnaIX?=
 =?iso-8859-1?Q?B9HffMabjQPkrKQHnj4KEb/HrPAG8OqwhelqGkwaBJsVlPOUVvVNIQ5Ljn?=
 =?iso-8859-1?Q?e/hfqWsfJ1mjyHzPQSgu1TdQFsOGI8gv6867OmAEr1ULKXloIjw4ktWftG?=
 =?iso-8859-1?Q?YqR57UrHqvgC1XTORLpiYFNZAscYoQGx+O+zsRZ8h3Zf63+WlTgXotwHMT?=
 =?iso-8859-1?Q?HQwNZgF2ER4uASroKvnXk1GEho0bqD6GHbShU5wV6u+gGqByESIeULCpjt?=
 =?iso-8859-1?Q?itUMS9fblLknVx4HRYn0mgnvf6LG8lMaYZThpPgg5uWDCzY4O0iXZ+2sCP?=
 =?iso-8859-1?Q?iuvwCL8GRku5TYxEIp6x4T4SfNiUaQ6AXq44ayG6ge/K2fhSgV+L0HPEou?=
 =?iso-8859-1?Q?+McbaQBlzfV4pB68Ht9+qp8DEFrd+wcFuK00d6SEDeVxrr4ettwRcHqJES?=
 =?iso-8859-1?Q?aag1+zljHThRIS8kY1oMxr7Eqvwgbu68zS1Yjl6HYTyfvtHClOzry7EOMs?=
 =?iso-8859-1?Q?TXJKinJapExog49WNJbgPofWwo2t6+QJX1aFBd8y0hFyz0kB9TLTlnrSv5?=
 =?iso-8859-1?Q?T0kMpxVcuaHBelyDR9r3EuxxX/Ly7I72zDHwQ7WP+lFtZnsQnZW9KRHBXQ?=
 =?iso-8859-1?Q?tq13Y3B7BTtMF+cRO/jr/5jMPEMQgAW/rNnW6Wp+kW3U0zaVrLjfZc/9hy?=
 =?iso-8859-1?Q?fGRv4vXtHSW9M9uC6O42xobq3pE99XwzJqaRLo0i4nwkGhyV8pFlruC1n/?=
 =?iso-8859-1?Q?4bsfneP9qMBumSFV0fTrnmDIYw4FZ0NPJLP1n1k4H+UKQTgmUfXd/hFYVQ?=
 =?iso-8859-1?Q?zTvknbclLfbgBWViOtD6xyrS7aGGYhb881uIBLF8fMRlw4DyMGjqPzwhdm?=
 =?iso-8859-1?Q?pgwqpBs3SyzJ3Tw/evSwjyvKQ7KriYXusKWTnHZIcTJ2YcITHEUeVroALk?=
 =?iso-8859-1?Q?zZMPWUXHJ9rp36F33uMPqZF0O2fIOF4oJnlO5jkXuUU9wcDTGntzUEtutg?=
 =?iso-8859-1?Q?zxe4ht+YPokbBBbAsEVBhs7YHfkexPvPXTvo2rvj0VreOHZbMSUNd4W3qj?=
 =?iso-8859-1?Q?k3TyM+tqjipyAY7XhZ1wZH+Us5GVmV6/0632wVNH8SrGWU1fYyZ+e1qKov?=
 =?iso-8859-1?Q?/9I9l6yobNA4StW2FtD1EiW/znAfI7xvvqRRiryu2r/KJrJSwGr0TNTLy0?=
 =?iso-8859-1?Q?8hjCOKSVTL8dN4QVJpe1LRSO0RAMXdPCkOO9l57+XQ+oliG1OTSo8zYJVa?=
 =?iso-8859-1?Q?gk3lJuVgUWqejhoplR1pJe3V8sV4CsAeIgRMdwHrl2wRJ9hcf63esexsCn?=
 =?iso-8859-1?Q?gc8ewyyygRcYN38wgqA0+v7x7PHwZQZJOsYHfGcDZ0jL8EScZIQ4GeADSl?=
 =?iso-8859-1?Q?HxDy9j7JBe5ioFzIR0sKNk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?dG0ctawcz7/1BL7NAFlVmVasseh+6njj5P24lnNjeffmx6SPjcYJiKA7+n?=
 =?iso-8859-1?Q?e2EKoIBovdLr4KR0AtLA4aLvQlslhppTdkBDAh33dn1OjpGcTjqrmgrLqJ?=
 =?iso-8859-1?Q?LtSPXAHJnYooWdoqUONCx6gHIPSL3Ca2fSLoMXMeiHboIf4U+v7buF3zo9?=
 =?iso-8859-1?Q?39fLvMB1cLmhpdpcdhxZ0FNPFLzlfZp4I/Z7KGIdBed1J45ExvCKY56o4v?=
 =?iso-8859-1?Q?bQGXYAA65bm2+Vx5KEkuxL9hvfxVkRQaxkDglbehnNo4q/kng90cAe5dhh?=
 =?iso-8859-1?Q?Yw4+dH5N/6n+OluAikZdusAK9bhGtl1EEI7CkzKzqmRvr2N4kVRP7NC8o4?=
 =?iso-8859-1?Q?EtlGCo4NdhMTQOaXbnxCxA7nA6SH0h6oMqNPQvwM4naZjvQMQyu1sCBKaH?=
 =?iso-8859-1?Q?QFH+X/qC4Yi67Msz98pJiBediUdzos+mkeegfM52IK6T5UTG+BfT6QTmaF?=
 =?iso-8859-1?Q?8FBKZmd3jwnen5ftMwaji6pQgCsmCNRTJI4INartZxO+Duod6ktbVIDgP2?=
 =?iso-8859-1?Q?WZkMPu8jMD3nKPaEjgIyspMJNWfVKT2ROuVpz8+ZAtKUVU5n6SD8eY19/y?=
 =?iso-8859-1?Q?IV/LT+O0M02XQ/YwF/jcaayG1QlBGc818q8HRWkQ8pOFI4Iqhv0F/GmHfe?=
 =?iso-8859-1?Q?BeFCH8uRgRERx2yUpHNvv0rsgo6O3DnQnqRBexUJ2VUjO6M3GJZGu7Dzrc?=
 =?iso-8859-1?Q?Re2yOXKRyjm13ulZuxYNE8zYkDCijftlW+Ec1k+AO3lSnbM4fALeVCo5Ge?=
 =?iso-8859-1?Q?8QQH8wCaARNVlsFimDmc7oROyImA9ftmN/nVrJvKWja2HgarRpbARGqKQU?=
 =?iso-8859-1?Q?C+0Lx18bjk733N1oSEiSbI5KoFUK3ZkEWG6UTKm1o6i87cv/rKQchCo172?=
 =?iso-8859-1?Q?pcsZoib73+D68xXCEbXs/PuYrBzdheSveEl9lPrkwdqhTDii0FuUMYyGeJ?=
 =?iso-8859-1?Q?ILK821O1kzIuIQ8N5ehGdRkVoUIhkQhqMrubIJ/Z1aki2vk3jvJTgL8IWZ?=
 =?iso-8859-1?Q?zRBLNit8eRBqhfHrD4MEeuuPHd2C6qjAeDN2WdXqQDkkNDTkDtHlyLJtJG?=
 =?iso-8859-1?Q?tUxo4ZvSfIhnUFJWpcEulsHE2+N7Q06tdZy2u3wWuoxlD/NETTAdkPozr7?=
 =?iso-8859-1?Q?EfFxnYmxs4dvJBBSOyaArR2Ez2N0c8q2jxjkIsqiWsbm/Lc6imsYEv3/fU?=
 =?iso-8859-1?Q?6nnCBsmm3CG4G5wSmzqA4ERkdNbf6jfQaO840a6wsqda3w7mNX//Fr+K6V?=
 =?iso-8859-1?Q?4GLeAuQQC6l4x6maB3qYqL+RVnumELrHubipmzRxcoH9WtUbpqTQfe6Xck?=
 =?iso-8859-1?Q?qhL6m2r545at3Ih59fzvMcTNOGAEtriJYvxxQXfDi9fUNS7y6CfKqYr5It?=
 =?iso-8859-1?Q?08GzFHvirVf0RXg8plY175Hh5t6poG+3fnq7Br+zipQXSDBcpGmUEiG6LN?=
 =?iso-8859-1?Q?/aVyMLRsTD642GqoU+ErqXIWKnsZrzi0X7imrHhf9k/yZIxasQJDBFYJ0A?=
 =?iso-8859-1?Q?IzjJsWyfe5JrZWezYFQfB2C6GqsEcCaTjdeDjd++yO2olZMREBjuf1Yy14?=
 =?iso-8859-1?Q?pmrreqn8Rz2hjH9ALiJFf4j68yZ0oVOUVoq6mq+ydE/Wd0JavyekgtGfhp?=
 =?iso-8859-1?Q?QxMnhsHAmPKKyoUTkKOn3EfFJsO9s8Kiyk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9ee281-2558-4783-b66d-08dd46c382d5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:32:49.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9Vd1jUM+srS/4L5fitwt0gme5dIae7dCylcGRBjxdpsse0aTJkIjQ1Q7jvapw6BfoEq72UH40foQ3KVrFp9Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477

On Thu, Feb 06, 2025 at 03:14:20PM +0530, Mukesh Kumar Savaliya wrote:
> Hi Frank,
>
> On 2/5/2025 9:14 PM, Frank Li wrote:
> > On Wed, Feb 05, 2025 at 07:49:20PM +0530, Mukesh Kumar Savaliya wrote:
> > > Thanks Frank ! please review below.
> > >
> > > On 2/4/2025 9:13 PM, Frank Li wrote:
> > > > On Tue, Feb 04, 2025 at 11:24:03AM +0530, Mukesh Kumar Savaliya wrote:
> > > > >
> > > > >
> > > > > On 2/3/2025 9:22 PM, Frank Li wrote:
> > > > > > On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> > > > > > > Hi Mukesh and Frank,
> > > > > > >
> > > > > > > On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> > > > > > > > Hi Frank,
> > > > > > > >
> > > > > > > > On 1/30/2025 1:35 AM, Frank Li wrote:
> > > > > > > > > I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
> > > > > > > > > API i3c_device_do_priv_xfers_mode(). The existing
> > > > > > > > > i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
> > > > > > > > > to maintain backward compatibility.
> > > > > > > > >
> > > > > > > > > Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
> > > > > > > > > with 'rnw' since HDR mode relies on read/write commands instead of the
> > > > > > > > > 'rnw' bit in the address as in SDR mode.
> > > > > > > > >
> > > > > > > > > Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
> > > > > > > > > is not implemented, fallback to SDR mode using the existing priv_xfers
> > > > > > > > > callback.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > > > ---
> > > > > > > > > Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
> > > > > > > > > one i3c transfer. for example, can't send a HDR follow one SDR between
> > > > > > > > > START and STOP.
> > > > > > > > >
> > > > > > > > Is it wise to add two function inside main funcion and separate SDR vs HDR ? so we don't need to change current function arguments.
> > > > > >
> > > > > > I am not sure if understand your means. HDR have difference mode, anyway
> > > > > > need add new argument.
> > > > > >
> > > > > let me clarify, We can have main entry/hookup function as it is.
> > > > >   From priv_xfer , we can call sdr_priv_xfer and hdr_priv_xfer ? based on the
> > > > > structure information if its enum SDR or enum HDR.
> > > > >
> > > > > > >
> > > > > > > I think the 'private transfers' are limited to SDR communications,
> > > > > > > would it be better if we have a different interface/naming for hdr transfers?
> > > > > >
> > > > > > The key is what's difference between hdr and private transfers. So far only
> > > > > > command vs rnw, any other differences I missed?
> > > > > >
> > > > > yes, but can we make it priv_xfer() = sdr_priv_xfer() + hdr_priv_xfer() ?
> > > >
> > > > struct i3c_priv_xfer is array, each i3c_priv_xfer item is indepent. Can you
> > > > write a simple code to demostrate your idea.
> > > >
> > > > Frank
> > >
> > > ======
> > > Please see below. My only intention is to add hdr/sdr decision inside
> > > i3c_priv_xfer and rest of the functions should remain as it is.
> > >
> > > If you still need, may be we can add local function but no need to change
> > > prototype of function being explosed to many vendors.
> > >
> > > I hope i am not missing any major thing.
> > >
> > > struct i3c_priv_xfer {
> > > 	u8 rnw;
> > > 	u16 len;
> > > 	union {
> > > 		void *in;
> > > 		const void *out;
> > > 	} data;
> > >   	enum i3c_error_code err;
> > > // Just Add below two members and rest can be passed till end point/function
> > > and can process as required.
> > > 	enum i3c_hdr_mode mode;
> > > 	union {
> > > 		u8 rnw;
> > > 		u8 cmd;
> > > 	};
> > >   };
> > >
> > >
> > > device.c :
> > > i3c_device_do_priv_xfers => i3c_dev_do_priv_xfers_locked
> > >
> > > int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer
> > > *xfers, int nxfers) {
> > >
> > > ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, xfers);
> > >
> > > }
> > >
> > >
> > > master.c :
> > > int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev, struct
> > > i3c_priv_xfer *xfers, int nxfers) {
> > >
> > > 	if (master->ops->priv_xfers_mode)
> > > 		return master->ops->priv_xfers_mode(dev, xfers, nxfers);
> > >
> > > 	if (xfers->mode != I3C_SDR)
> > > 		return -EINVAL;
> > > }
> > >
> >
> > The problem is
> >
> > struct i3c_priv_xfer xfer[3] = {
> > 	{ .mode = SDR ...},
> > 	{ .mode = HDR ...},
> > 	{ .mode = SDR ...},
> > }
> >
> > i3c_device_do_priv_xfers(dev, xfer, 3);
> >
> > How to handle this case?
> >
> > I think i3c_device_do_priv_xfers() means one whole i3c transcation:
> > START, xfer[0], xfer[1], xfer[2], STOP.
> >
> > Frank
> >
> I think they are separate transfers, it means one call but multiple buffer
> to send with separate start/stop.
>
> Two options :
> 1. When multiple transfers in a single call, driver internally itrerates and
> should take care of start-xfer-stop. I think HW should be taking care unless
> using the restart intentionally.
>
> 2. if any xfer[i]  has HDR mode, internally it can call local function OR
> should diverge based on mode wherever it suits better to do.

We should define such behavior at API to avoid cleint driver guess master
controller driver's implemtation.

It think xfer[n] by one API call, should be one whole transfer.

START xfer[0], REPEAT START, xfer[1], REPEAT START xfer[2], ... STOP.

If xfer[0]'s buffer is uncontinue, it should be use sg list. But i3c data
len is related small now, so one buf point should be enough now.

If client want to multi START...STOP, START...STOP, it should be call API
mulit times.  One API call only support one START...STOP.

REPEAT START != START.

About HDR, according to spec line 5522

START SDR_CMD_ENTER_DDR xfer[0], DDR_RESTART xfer[1], ..., DDR_EXIT.

So seperate/extended API is needed to keep API behavior simple and
consistent.

Frank

>
> > >
> > > svc-i3c-master.c
> > > //process everything using xfers.mode  and xfer.cmd.
> > >
> > > I hope you can add all rest of the changes inside this function itself.
> > > static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct
> > > i3c_priv_xfer *xfers, int nxfers)
> > > ==========
> > > >
> > > > > > >
> > > > > > > > > i3c_priv_xfer should be treat as whole i3c transactions. If user want send
> > > > > > > > > HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
> > > > > > > > > instead put into a big i3c_priv_xfer[n].
> > > > > > > > > ---
> > > > > > > > >      drivers/i3c/device.c       | 19 +++++++++++++------
> > > > > > > > >      drivers/i3c/internals.h    |  2 +-
> > > > > > > > >      drivers/i3c/master.c       |  8 +++++++-
> > > > > > > > >      include/linux/i3c/device.h | 12 +++++++++++-
> > > > > > > > >      include/linux/i3c/master.h |  3 +++
> > > > > > > > >      5 files changed, 35 insertions(+), 9 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > > > > > > > > index e80e487569146..e3db3a6a9e4f6 100644
> > > > > > > > > --- a/drivers/i3c/device.c
> > > > > > > > > +++ b/drivers/i3c/device.c
> > > > > > > > > @@ -15,12 +15,13 @@
> > > > > > > > >      #include "internals.h"
> > > > > > > > >        /**
> > > > > > > > > - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
> > > > > > > > > - *                specific device
> > > > > > > > > + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
> > > > > > > > > + *                     specific device
> > > > > > > > >       *
> > > > > > > > >       * @dev: device with which the transfers should be done
> > > > > > > > >       * @xfers: array of transfers
> > > > > > > > >       * @nxfers: number of transfers
> > > > > > > > > + * @mode: transfer mode
> > > > > > > > >       *
> > > > > > > > >       * Initiate one or several private SDR transfers with @dev.
> > > > > > > > >       *
> > > > > > > > > @@ -32,9 +33,9 @@
> > > > > > > > >       *            driver needs to resend the 'xfers' some time later.
> > > > > > > > >       *            See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
> > > > > > > > >       */
> > > > > > > > > -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > > > > > -                 struct i3c_priv_xfer *xfers,
> > > > > > > > > -                 int nxfers)
> > > > > > > > > +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> > > > > > > > > +                  struct i3c_priv_xfer *xfers,
> > > > > > > > > +                  int nxfers, enum i3c_hdr_mode mode)
> > > > > > > > why can't we pass mode as another structure member inside struct i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
> > > > > >
> > > > > > If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actually,
> > > > > > I3C can't do that.  we assume finish whole xfers between one whole traction
> > > > > > (between START and STOP).
> > > > > >
> > > > > > Frank
> > > > > > > > >      {
> > > > > > > > >          int ret, i;
> > > > > > > > >      @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > > > > >          }
> > > > > > > > >            i3c_bus_normaluse_lock(dev->bus);
> > > > > > > > > -    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> > > > > > > > > +    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
> > > > > > > > >          i3c_bus_normaluse_unlock(dev->bus);
> > > > > > > > >            return ret;
> > > > > > > > >      }
> > > > > > > > > +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> > > > > > > > > +
> > > > > > > > > +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
> > > > > > > > > +{
> > > > > > > > > +    return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
> > > > > > > > > +}
> > > > > > > > >      EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> > > > > > > > >        /**
> > > > > > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > > > > > index 433f6088b7cec..553edc9846ac0 100644
> > > > > > > > > --- a/drivers/i3c/internals.h
> > > > > > > > > +++ b/drivers/i3c/internals.h
> > > > > > > > > @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> > > > > > > > >      int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> > > > > > > > >      int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > > > > > >                       struct i3c_priv_xfer *xfers,
> > > > > > > > > -                 int nxfers);
> > > > > > > > > +                 int nxfers, enum i3c_hdr_mode mode);
> > > > > > > > >      int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
> > > > > > > > >      int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> > > > > > > > >      int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> > > > > > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > > > > > index d5dc4180afbcf..67aaba0a38db2 100644
> > > > > > > > > --- a/drivers/i3c/master.c
> > > > > > > > > +++ b/drivers/i3c/master.c
> > > > > > > > > @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
> > > > > > > > >        int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > > > > > >                       struct i3c_priv_xfer *xfers,
> > > > > > > > > -                 int nxfers)
> > > > > > > > > +                 int nxfers, enum i3c_hdr_mode mode)
> > > > > > > > >      {
> > > > > > > > >          struct i3c_master_controller *master;
> > > > > > > > >      @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > > > > > >          if (!master || !xfers)
> > > > > > > > >              return -EINVAL;
> > > > > > > > >      +    if (master->ops->priv_xfers_mode)
> > > > > > > > > +        return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
> > > > > > > > > +
> > > > > > > > >          if (!master->ops->priv_xfers)
> > > > > > > > >              return -ENOTSUPP;
> > > > > > > > >      +    if (mode != I3C_SDR)
> > > > > > > > > +        return -EINVAL;
> > > > > > > > > +
> > > > > > > > >          return master->ops->priv_xfers(dev, xfers, nxfers);
> > > > > > > > >      }
> > > > > > > > >      diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> > > > > > > > > index b674f64d0822e..7ce70d0967e27 100644
> > > > > > > > > --- a/include/linux/i3c/device.h
> > > > > > > > > +++ b/include/linux/i3c/device.h
> > > > > > > > > @@ -40,11 +40,13 @@ enum i3c_error_code {
> > > > > > > > >        /**
> > > > > > > > >       * enum i3c_hdr_mode - HDR mode ids
> > > > > > > > > + * @I3C_SDR: SDR mode (NOT HDR mode)
> > > > > > > > >       * @I3C_HDR_DDR: DDR mode
> > > > > > > > >       * @I3C_HDR_TSP: TSP mode
> > > > > > > > >       * @I3C_HDR_TSL: TSL mode
> > > > > > > > >       */
> > > > > > > > >      enum i3c_hdr_mode {
> > > > > > > > > +    I3C_SDR,
> > > > > > > > >          I3C_HDR_DDR,
> > > > > > > > >          I3C_HDR_TSP,
> > > > > > > > >          I3C_HDR_TSL,
> > > > > > > > > @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> > > > > > > > >      /**
> > > > > > > > >       * struct i3c_priv_xfer - I3C SDR private transfer
> > > > > > > > >       * @rnw: encodes the transfer direction. true for a read, false for a write
> > > > > > > > > + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
> > > > > > > > >       * @len: transfer length in bytes of the transfer
> > > > > > > > >       * @actual_len: actual length in bytes are transferred by the controller
> > > > > > > > >       * @data: input/output buffer
> > > > > > > > > @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> > > > > > > > >       * @err: I3C error code
> > > > > > > > >       */
> > > > > > > > >      struct i3c_priv_xfer {
> > > > > > > > > -    u8 rnw;
> > > > > > > > > +    union {
> > > > > > > > > +        u8 rnw;
> > > > > > > > > +        u8 cmd;
> > > > > > > > > +    };
> > > > > > > > >          u16 len;
> > > > > > > > >          u16 actual_len;
> > > > > > > > >          union {
> > > > > > > > > @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > > > > >                       struct i3c_priv_xfer *xfers,
> > > > > > > > >                       int nxfers);
> > > > > > > > >      +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> > > > > > > > > +                  struct i3c_priv_xfer *xfers,
> > > > > > > > > +                  int nxfers, enum i3c_hdr_mode mode);
> > > > > > > > > +
> > > > > > > > >      int i3c_device_do_setdasa(struct i3c_device *dev);
> > > > > > > > >        void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
> > > > > > > > > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > > > > > > > > index 12d532b012c5a..352bd41139569 100644
> > > > > > > > > --- a/include/linux/i3c/master.h
> > > > > > > > > +++ b/include/linux/i3c/master.h
> > > > > > > > > @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> > > > > > > > >          int (*priv_xfers)(struct i3c_dev_desc *dev,
> > > > > > > > >                    struct i3c_priv_xfer *xfers,
> > > > > > > > >                    int nxfers);
> > > > > > > > > +    int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> > > > > > > > > +                   struct i3c_priv_xfer *xfers,
> > > > > > > > > +                   int nxfers, enum i3c_hdr_mode mode);
> > > > > > > > >          int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
> > > > > > > > >          void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> > > > > > > > >          int (*i2c_xfers)(struct i2c_dev_desc *dev,
> > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > >
> > >
>
