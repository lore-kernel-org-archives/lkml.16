Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA91A2564;
	Thu, 22 May 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939617; cv=fail; b=SnCZQgqOK/yZD/kosk7rWiBvQiofpbpgcwei3WP01qBlo+ALQvuzIoRZgeGBNKs+YFehmc6X6uhJgazdB4AYujmHfAW0KsSY2dOqNY6v//gxwX7ro5TWdY1Ok1RC501LrV58+N0xNX9w/ANmRNoDXo1+L1eRXGquTKyXmeOj0lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939617; c=relaxed/simple;
	bh=+UagWKKmvLTfAXoITnprg4jf9yPhmbN6SefuthkjktU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ton0Hv/x4Ag+3YL2T9ketGoRD+cdPl6vh5w98rZD2axozNDzmjPxuf8QyOr9EI2KJyOSI8kXBPe374BnH0s1rkEY6HeuuJpZwxkFw3QLUveSUWsMx4kfygVX/WcIA6IIk7BCgYkowjvosrLn60N7YdiHJe0GA/gb6cHdIpCZzJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FC5TjwW7; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FC5TjwW7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nbs336zWFstE+Sj0t+EAMLuH+sdYJ4SCi5xuVQAOj0XTkabmOJPuKQDvgsTYi0BZ6mupRyfgTNg/M7WtNlnkV7U0ClhIzzAPlJjv87Gq+T69vhhokUUZFVsvh2BTZ83dqaf56P+tCcotuF+Ldz6p86eRDDQbFtY6jB+5qIhePA8+nKVfB2dSF9/acXtsgoNUD8RewKqe7GKZ73/FQff/Sn8BHoGsOAROuozHDxBGMFcsEyu6pFqRYYf7A0s+/7ciOrd+xaLXMvfVJAw/mxZH9X1GU9i3QbfawUHgnV3xdNkk4JgLgbgQ3gb/n7ClB5KQIM9V6onxga+6JVE5JRHYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbfhFnFJbzcScYd+5+U8udh4BulQUkGtdnRaJVgiW20=;
 b=gquUvmOMjQhgL0nZG4fDHHEVqrdLBEZN/OQjK6neO5KRAzew9WceS448HDPaCu0MSozSfKp9i8ZbdZX1W54aKWVLsiOA5rFLgL6xKWwTpFOEAxTZvAE6sgLPdcDEQF9fKzCSk5jeKsOOOfvNSeIe37DBf6HrDJAJBHDr+OZl0Kb1FKGC8otNIotbN+qX9XHsNdCcSDU6+UqqpfyTLm/Ws9HuDp1iNEu+iqboX6vju4kLGWT+m/SMP4TEA+sUgjJq542I0M0yGfBl4Hz5d6ItytQSpcizFKw+V9i3rLdaMyVGniv1vHluVdPBd5V9vEpSllea6bqbQzkmjC8kdav3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbfhFnFJbzcScYd+5+U8udh4BulQUkGtdnRaJVgiW20=;
 b=FC5TjwW77poY9O5TP7IHA84y7stb8GmufGAdSyh4BpTJjab4WxxUplcOlNfUUQ7O6yKXJIoByet+p6COzGmphSSh2xot7sgEWs2+SR4JDLN6D96CDQbPHD782nkxjiQ1w5tsSC5cerltdPurwOgfm8kbKm22T4jN+h7LXX/fPpA2E7eOZKYOxCnNvKsomFTr16C1mvZUIRZ5HOXHKkaIfM6XbihBqi6oZPPF4aSUaIhZAhBKou9jrtmo4EmTLXVTMCGTAiqNlktuqVRF5InhFrAi6+qQNkt0xsW/d7Nyu6dKP1Iu9Nhigz6SKAYJLVezp0+OQFEtp1zi6M2UlufaVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 18:46:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 18:46:49 +0000
Date: Thu, 22 May 2025 14:46:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Message-ID: <aC9xFMKG88OOH2xV@lizhi-Precision-Tower-5810>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <17145d2f-5d07-4939-8381-74e27cde303c@kernel.org>
 <GVXPR04MB9778335A5DFAB37CC8D011FC9997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
 <ef92c390-d136-46b4-8219-294c449e4092@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef92c390-d136-46b4-8219-294c449e4092@kernel.org>
X-ClientProxiedBy: AM0PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: b53d907d-d765-458a-a5f0-08dd996102d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cmNrWkyn9f0Lh8olF2y+HliTVrHkBhAkzwjQWSG3cuQfAg11xp4aSctQ3Azf?=
 =?us-ascii?Q?Yx2Mn1i90qdiHzlxnFL7YuN3iAiGl+Q93jFpyvhbISgqIrEjR1AL2xRR0grc?=
 =?us-ascii?Q?2oDTkau8l4ZcI+UiMQDYCoWtdFLMpIQEUKbSJKi9GRbA9uWrJs2EaSSPBWnI?=
 =?us-ascii?Q?CU07HaVc7jEyNz9Pj4eMWodjnd6sJ+gpZw4tWOOTjz7VInZzvlya2yyYWNkq?=
 =?us-ascii?Q?vN540a+wRd7Fl65rXTZaO03THYFhrO1ynNYyssBJjmTqrcJUjiHb9Jv+JUIu?=
 =?us-ascii?Q?RJyeJQm+9d7IjwGcxB8keChv4dAOMva0LJAc+PMkHWU/uJ1nIJEiqYbzZ5ik?=
 =?us-ascii?Q?4VRElAUMh8RQVU/3RAcHp/rsQDf4BCT1/zykQJq++a+tpCLlTH8IsR1l3UDZ?=
 =?us-ascii?Q?uNjtuvwEhPUdCxHQM1pc/ZW93iOyIi5GQJnvbHXI0326jh0qbTz1+y/WgdVN?=
 =?us-ascii?Q?NrZRdKLLea0yislXgYLXxHCZ0MB8itX5uMf6tvzMTOM+7Hav6vFxg4dQvD+K?=
 =?us-ascii?Q?WN9WX8pPiGpI8MXhTF4Y+1cn4HycPtnRXcVmQEKzCFkOmm/dzzlPcwpkhweW?=
 =?us-ascii?Q?zGRqeVkRc00jrF9KefGuvUpw+xjs7sdnNoYZ0afseCD+wgmDSk2XFcGdl/qM?=
 =?us-ascii?Q?tGs3brRrxGGKMTCroRKQ0lhcMGJFENju7tr/mNjJb2ZjnoultsmFZtUK3p22?=
 =?us-ascii?Q?E+Wkabs7DCt9dPWyHeQB6maqWlDwPTxbQyRxn7r+gdc4640MuSyLrY1XoxNx?=
 =?us-ascii?Q?uivoPaIvmiFsrpqja3j9SAAzyg2B4dWCS7Yy60kwmewPj4zbuh2jBmwIk+pp?=
 =?us-ascii?Q?V5j8r+ZjbH6yU1SlZdr9q7lAaHG2g4kdaavpZfz5gZMhGR2m+Eqn+MiVHCW+?=
 =?us-ascii?Q?Eg3HE0aRKpD+wG4RUtbZw2RDVdDW2TI3AZdkfPDbqEtoPmYVVvFqhwlr9c9R?=
 =?us-ascii?Q?fhAoa7jH309A4QQsPhvWhAjkABFy4EwecDnTrzx7lDE2k9jGSBWJSs9NGffi?=
 =?us-ascii?Q?RaLRAG1hwXCfDHw74sWXwJXXujft4QzB9n8YvDGAeH1o2cV8T2Bah6gtM21p?=
 =?us-ascii?Q?UTDMwca9ee3a/v+J7llErPbG6IWK4aCx+9zNrrTmCGVaUGZp/izo+QFufpDZ?=
 =?us-ascii?Q?Io8fkDysTgMQu172PBy1VgSbJmdIVaZx/iCxq+yShzJcLf1yh2OYevfFojC1?=
 =?us-ascii?Q?whgRVmv8WO5TFoPi/zEUsiN3XYpIrDmM98kCLVVqT3Lxkkl5RMaXIMB/zeOS?=
 =?us-ascii?Q?hp24ofMAaz2EuxH/W93rMMP8MDKIjS9Vbqj/l5rdZVEP73l/NIuTZSD5IWEz?=
 =?us-ascii?Q?KDA9R1/mHQrm8ExKSnFMWQRe33WZAYE0ZgKnKguvBZnn3DhGpcRyvNNKIv6T?=
 =?us-ascii?Q?qiCcAYqTPI2zLWJmLyWFH52qWT1A+GUGwWxL6cC0X+qOlsAS39Q2VWjRmEHQ?=
 =?us-ascii?Q?ryuQgjji/dUuO6nrOzAtYvUxJSl3g5S6vbfuzEbzJ5M/m2x7CY1DMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4AFadT9JgNQs/6aYCKxGZrqWhy1vcUs4OmzX80jeTguPGvMDAasn21Ef7hMT?=
 =?us-ascii?Q?idy6rMenchsN6+fc5J7fjDmpkkR3R7lRkQlJ3aurPnQF5L9yTNFhNCNSIZ8Z?=
 =?us-ascii?Q?wNYDRVd8jCFb/SbMsClUVDB2IgrhEnf8NopAUhwoRSyOy83t6EEK/d92fZR6?=
 =?us-ascii?Q?fF2VI1hq4gMmotO9X2wnUrMFiEM/UekJhFWX2/++kMzfGY66xJdBsKcnpWE8?=
 =?us-ascii?Q?IGVmyvFAcSfTR3imVwZ5PGz11hdOOHJ1cBJvt8BcGe9kgmxy1OF0EdJNIxmJ?=
 =?us-ascii?Q?HFR8+CLD/OBxLgJY9iOt+S0OeysUwc/+CPBf7CNgg7OSr990OP9565YBZ6e4?=
 =?us-ascii?Q?iL3ukQh4XZ9RYWIiyGRBhNTbL7b2Qox+4pUE+vBPHTuOyKD9lk3HamF4A7Eu?=
 =?us-ascii?Q?B+KU2q/NiU7KHlQyFI+q/i3kAOTC97gYY3MDElnHOfQiSmd4C1GtuGBAeewQ?=
 =?us-ascii?Q?o3/hzyxBaPmo5FmPNYn9iQPo4+NiGs+SiREF+MMKx0qXr3kFfUYf5Kww4ICP?=
 =?us-ascii?Q?jgd0LyjAAVzwzEgnS4yQn3E5W7v4ikmvttNLGbqSQ2FQJp5HMLJdcF1tFo9S?=
 =?us-ascii?Q?LfqDzbWjJ/1H6UgnxeJGVhfUd8jIAGVOgmt94nxSTgYP5x6iQ62XtdOt1PDl?=
 =?us-ascii?Q?QDLKHh4g3eqPN0TFJykZgRQp+iZI9I5JF2AduFjrB+tFTEKBwBG01Zlx96KX?=
 =?us-ascii?Q?OPBSoB+WXCrhAxtkN8l6odTSLVNjv7SEnOP7fxJnJwEj4FiIDjSU/T4do9uO?=
 =?us-ascii?Q?lWz/zxQENuj5Gh3oi5Q4Uyiwj2Nb0Yxdw2ViqDHdR6etwBHOY9TmickJ/Sl5?=
 =?us-ascii?Q?pOM/E8xVqKLpIlu7ysT8soO42uvtC7zj4Bll3qPLGCpNtJGGjKnHaXZ3RjF1?=
 =?us-ascii?Q?Zqt2M7DEjZzZNdqk2ZJxg4HcFgv07cYFcIxuFXTQ8zn1j0ZZAkN7TudIK+2c?=
 =?us-ascii?Q?ICHk+IdtihhTOBtQLdFBDN9yWHRmPOvVBcXv93ugH5GrWkqgEzOfX95inRle?=
 =?us-ascii?Q?uT9CJ0SIWf1jSpmH8/yI7oGYyFEnkZ6s73WhTojxSzLudv5nuKfs9hHoC4Sb?=
 =?us-ascii?Q?6slo7sJE/iq028p2JQawkwSgRtFrntdN7FzJT8gzIFTqdQJmeF8N0me0EjPv?=
 =?us-ascii?Q?rQ/jemHan9jPWZDM8NLyIF/YouEYnBbBwXxwTFFkFTDWeFvtTpbtPgVLzsEW?=
 =?us-ascii?Q?eeh1r7ztgTyfOn0Bw1H12blxvy6P+/8+Yni+c7FqxUQ4oVvnnG2scjGChmGB?=
 =?us-ascii?Q?FJPnI2bowofdqgotD/rg1XvRroirnio8j7PLCb9oix+kXSBtpn/RxrwPrTye?=
 =?us-ascii?Q?XHMT8/H5atpWBIq+DHUw2XgsNvFhbie5I3VLZk83e/7ZFJAyol9rgDp2iF10?=
 =?us-ascii?Q?8UxromtRRpa6UkQHeAqNxCdQF1CvR5KKIm8cQF0+0D+VN1LdKZfTlk0+UEgP?=
 =?us-ascii?Q?dWkuJjqLK89KInIGLo4UmIrK+hOsHKicJsbcymrK5VmVygOJHVQIbf9PtCyy?=
 =?us-ascii?Q?tM18bsmknvihqIYdWtijtDhjXwHORKuNMxJuzq4eb14WocZfxzvOF+n7Mga1?=
 =?us-ascii?Q?nHSj6NM0PtmtzWYfGk9k6pSBWgI3nWzLACcxRzCa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53d907d-d765-458a-a5f0-08dd996102d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:46:49.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hh7G0pRxnLYpxcJ2XyEzQIj9zUvwITcbDwpt9PiK4AIBN/w2KfvOZ4zM66+rPOn+AHWO+PWzYVVk2QjdJxgJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

On Wed, May 14, 2025 at 12:10:11PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2025 13:45, Aman Kumar Pandey wrote:
> >>>
> >>> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> >>> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> >>> ---
> >>> V1 -> V2: Cleaned up coding style and addressed review comments
> >>> ---
> >>>  .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++
> >>
> >> Not much improved. I have doubts that you really looked at other bindings.
> >>
> >> Filename matching compatible.
> >>
> >>
> >
> > Thanks for reviewing the patch.
> > There is no existing entry like this one. It is the first device tree entry for any i3c target device being added to Linux upstream.
> > For I3C target device, compatible is not required as per i3c.yml. I am adding compatible for backward compatibility with i2c binding ( i3c target device have backward compatibility).
> > Should I use compatible matching filename in this case ?
>
> Do you have compatible here? Yes, you have, so I do not get what is
> unclear in my comment. Rename the binding to match the compatible, which
> you have here.
>
>
> >
> >>>  MAINTAINERS                                   |   8 +
> >>>  2 files changed, 340 insertions(+)
> >
> >
> >>> +
> >>> +properties:
> >>> +  $nodename:
> >>> +    pattern: "^hub@[@.*]+,[0-9a-f]+$"
> >>
> >> Drop
> >>
> >
> > Sorry, did not understand your point. Could you please give some clarification ?
>
> Drop this nodename. Remove it.
>
> >
> >>> +
> >
> >>> +
> >>> +  cp0-ldo-enable:
> >>> +    type: boolean
> >>> +    description:
> >>> +      Enables the on-die LDO for controller Port 0.
> >>> +
> >>> +  cp1-ldo-enable:
> >>> +    type: boolean
> >>> +    description:
> >>> +      Enables the on-die LDO for controller Port 1.
> >>> +
> >>> +  tp0145-ldo-enable:
> >>> +    type: boolean
> >>> +    description:
> >>> +      Enables the on-die LDO for target ports 0/1/4/5.
> >>> +
> >>> +  tp2367-ldo-enable:
> >>> +    type: boolean
> >>> +    description:
> >>> +      Enables the on-die LDO for target ports 2/3/6/7.
> >>> +
> >>
> >> NAK for all above properties.
> >>
> >
> > These are not vender specific properties. all these properties are as per i3c hub specification.
> >  What should I change for above properties ?
>
>
> What do they represent? Regulators? Why would you add custom properties
> for controlling regulators? Why would you enable LDOs for ports which
> have nothing connected? Why would you not enable LDOs for ports which
> have something there? Why these are not properties of the ports?
>

power supply cp[0,1] has two options: one from internal ldo, the other from the
other regulator.

So I think it should be *-supply

cp0-supply:
  description: phandle to cp0 power supply.

because internal ldo can provide difference voltage, I suggest export as
standard regulator

regulators:
  properties:
    cp0:
      type: object
      $ref: /schemas/regulator/regulator.yaml#
      unevaluatedProperties: false

Frank


> So many questions.
>
>
> Best regards,
> Krzysztof
