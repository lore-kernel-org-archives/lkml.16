Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012064.outbound.protection.outlook.com [52.101.71.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C7D17583;
	Fri, 20 Jun 2025 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404980; cv=fail; b=eMXxy9rVig7B74cmt7mtWPWxSTTiYcq2o6YmalOyEORU0wAP0ncH7DO+Ib/pfP+rcZT+8VD83iVSm8fzf8UdC+XYm6Ldw2L0jdTInqS7dzBRN8uZw20cGDHIYIwOoHVk5LXgnyg8i03PCskwwHOKSMcKQJnpGEZai0SMSwEwltU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404980; c=relaxed/simple;
	bh=6uPcoaVyrC8nbTG0asagZgngWoYUkO3MHw/+hvv8Xqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U7Bbiotc7D1hhw79WkKFhxv0v60i8jTzBDlwzxtdgGdsIMwYotOAWk+tWjQ8hBLz0qioIQEsecYNzNFDXA0398bxiOTGm5DJ1OeDGc0K7KjUaj1SpRCoSEukimdCz5LBuY0UHcqFjc6M1YxMOqfut1BWN2jHCsCAq3AMbBnAXm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uwdtHSME; arc=fail smtp.client-ip=52.101.71.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uwdtHSME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2oAXKpMwduM0P7ck/TxaNP42h4McYPbzirmHhW82a/kcC6XYe8xrZeUnhB0IyvytFGRJLSMpKkOQJRF6NBGVmk5pvqkSfr3CbPn5/Q6zI/Th7TGjJoLOgOx+13X4AN0Wo9Xz/eLmtxjTREU6JM5Syr1i0EQZNjkBxlbZZri3h5U0T1sW/V8yfpkPpgsBYgey/e98kn/Wep6lWrF0zEgWfLggmZsr2AiIr1Hn6KLgKp8ZaoJ4eW65rQA+qD1O1DWrJE77Me0OeQKodjlV9X9klU2J5snlda7JQki3AlRnoZKIvt0gM2dbQ2bSFpOjPhHF39xlLOHDzuwUmOUEAWYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEUK7B4dmwdfbRmsiYzMAMscAiSFYXDxbHesbi/bE9E=;
 b=rwzqoHO3Z6+x3LDs0XxXAR3xdo2UMyNdiw0RjCpusbUowliKZdUXarf8QCPwGAykrsAPBc7ktVgvVE6HdsGCFGedZJEzisxE+HuiAgiRYrusB7xSWEOyTTbf/PU1oX7eNiibe4t0GyfXyS80XuWvqLrEil+QAOGtqJLZ7aSGKdAlZ4mqS/6P7hI8IRNxaaXPhhy7eGiMkwdihX53a066RPxifMj0zNM8oFiohUAZu+ydgWp/TtXYpYIyhhV7OmDhLp7mx0GjDOlDBuwv3ab9up6CT4byyv4bzy6/AO8sIZ5qAo6eFXmtVPWy+GKOKPcYTI3M8UoqdrexUlJyfmV2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEUK7B4dmwdfbRmsiYzMAMscAiSFYXDxbHesbi/bE9E=;
 b=uwdtHSMEwO5w3mcTK5fLZtOpKepIMitUXyuSMjs+8YVe52/NTFCPznhWA6uRrRGA/b4B2p3eYn1AXuUCbrTWBs5k7RtWIcpEkbW7BOK2th69Z4kCMPDibfFaxP7DwEdmTkGzEw1NfJ0fAhdZfLf7OasWmcvrP204IxzevMRuI6FPzCSnIzQVeCGQwR20XJ8LfKukwp+H6PfAtWJAvg/uRquddO8lgZZXLQs9iW2G9shbD2FMbJimbII9FaJ0JysekNRS3P4mxvyjj83SIf4Hajj6a1L9l5egcqHLyc88uP0GfITHBs/hHS4zQJGNAbfiX3n3vLeMX1P21VXZefYgXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9223.eurprd04.prod.outlook.com (2603:10a6:102:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 07:36:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 07:36:13 +0000
Date: Fri, 20 Jun 2025 16:46:34 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <20250620084634.GB27519@nxa18884-linux>
References: <20250619122004.3705976-1-philip.radford@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b90efc-89bf-4289-adf1-08ddafcd21d8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RwXgS37K5vtMVFkqLRUigFBdGcSEx9H39PB6xynJXtwdxMKUuEJa111BR23n?=
 =?us-ascii?Q?md4DcrfyTNJGOAGhZfYnGesTBqYrt5RUm+r2cHjjvcWzP/Nnh1829ZKM93PT?=
 =?us-ascii?Q?YD+jcAmZPXPzFJZ4vKPz0ryJqbSK6rN2o2mfw1l2+m/UaEL0aOL/rua9NdlJ?=
 =?us-ascii?Q?hBPBtUstaAL6oWs26jbLG930x54oOHP5NLklLhhXevrC50GIYWM1ERuxbB6/?=
 =?us-ascii?Q?PHKTLfKH9x91J7YEtljSC1gyvG4KaRsbeeLyGY1aaLPsOSk5xzJblQD3KZ5G?=
 =?us-ascii?Q?TbHvidLOKhfrLwCHGURdtpNgoAsrsf3dloS2E+cd/9yOuosFcZ3+qDhQrPzb?=
 =?us-ascii?Q?+4EuW209ifMY0GF/+zQQ6T+krIyYfeh2MPSnx+n3Wan39suqe73DI2XUos8j?=
 =?us-ascii?Q?GbauA58oSe5HXxQPAgxS8LTbVPisoGDMjV7/ef2yl+kjdbnpmyyU8RUPHQyk?=
 =?us-ascii?Q?DQxRbUNNb6y0f4d/9roATvpGBcGYGBq1+Dek6OLBYeyFcSejVcqsvNZ7ODLN?=
 =?us-ascii?Q?VuNrM4B2aMkmVRh8Iq5kso6gdgP86WpM7MEh2KPkXjHxNLV8BXUMRoP6D8CR?=
 =?us-ascii?Q?s4hFzENJfkopzFL3ryChRfD/jTzROePiYznsLk9bXi7LYHdnAXLJAJPYCP+1?=
 =?us-ascii?Q?sbkWlfyN1HhEdE9xZnhbNzQwEMWvZOXS4OuPd9NhLuSwpSeuUZg9wxl5Njfi?=
 =?us-ascii?Q?OgNQ7ETXWGHyjIYc6ZhCgQgyokB7UBorNVV3t4s08fKjkk+2OM1cp2TN5PFV?=
 =?us-ascii?Q?7yzxfM2OFmJEnfQYoI6fNAOQusgpYN9Alz8vHHVu1VU7J7+R/EaCpttuyz0A?=
 =?us-ascii?Q?cK84vlkuX3s7TD/in7rKbfPThwPs5O1gDcJEkiEsP+cel3Bydi4e4NmMeP8a?=
 =?us-ascii?Q?UiifYky2BPpOpwM6/mgBjIYM6zyzYhEI9bxe7QI5niD4Cxd6bB6eUc/UMH7H?=
 =?us-ascii?Q?kVc8Zb6n7llEyLsOTfdP50jug4H8MXCDnFLZAsZtqbXKxlt/lmc6B/pItVRB?=
 =?us-ascii?Q?QEd3hhqDM/MiBhb5NPlc1E6Ulwl+y/3sO21P8GoDOHxcq5R5UevOpuOTPybs?=
 =?us-ascii?Q?KJI1tnxU6SF+sY0x/qVu7pd2WWa3guzgbcTNaVgbUCZrK5R585tWFTyk/Shz?=
 =?us-ascii?Q?q3SOUE/pn6F2f2HLoIcJRFXkQ2HFw8/X+dJOKJhd8cLe4Y7tAYIsywtNDx8V?=
 =?us-ascii?Q?2YS14czaDD6cM9q6+AZGL7vYIfSfj6Ve1WQkflbMwCKM1lD+omwq9vqfT2b1?=
 =?us-ascii?Q?o3EgfIr582mAMIeopeL2UsgbOpnn7OUKEWFtfuR+TiBG97JLol0nMR5Db4V/?=
 =?us-ascii?Q?PS+cFVYhjiW57sf2T5V8I2mcl5xV726D5TrMOWcYE/rKF1INA8nVrpkMPQHP?=
 =?us-ascii?Q?sw/1bezP4NUovoJWCHYu52i46PgJ31xxmXxDOQvL0ErJZimBvg0gg407YWQS?=
 =?us-ascii?Q?cGHfVkFYF9ptx86i4U0Q8409PXlk7gC2eh2bmAVNfhuWMMgdfx+Now=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?72oB8W6yKTZIneibJroSImB3dAtCsb7rz2l9ULdAIdBe2b0N7A6CRu0ddE7u?=
 =?us-ascii?Q?oqU/svhm4s3yHepwz5inKcWpDE7fRpj1SN0Io8iHBxSDZX9I5TM/zlyrHGYj?=
 =?us-ascii?Q?8UT2WslRsfJ44ba8sO+EZ8UkYJvJ/CVXlQq7VE6f6efzdDSqHxGRU/1eJmRT?=
 =?us-ascii?Q?Ogxj7cOX9hLGSnFxDyqjTNKMJlRb24HQ4CFAVqHIxi8NBQP9qFtEAIrohPWT?=
 =?us-ascii?Q?VfANCZ2k3Rf5oP+AAvQXFB4y99EHCig0hQFN+2QpzIpnCoGUs4ugwu5IBMKu?=
 =?us-ascii?Q?O6Rj/Pns5fubuAGeOV4pa23TOhuh9HtfJ26lhChg8DTISBKGxGTpANF2uxPw?=
 =?us-ascii?Q?gh40gRtxbGr1WKUh0H29okzY1CLTSfknEag+Vl7V8+I0qlDUCJ31x/XrkO33?=
 =?us-ascii?Q?Q1GCODctb1Lea3mbpG+1/IK8jkRNl+d9Xu0+sHYC66m0HqcY3Qlhn/Rok4Z3?=
 =?us-ascii?Q?giW9ihrhf7MRPio7Ahh9Yd58NQDjbG8UfxxVrESl9SvwnqSOR0ZIq/UTTRU3?=
 =?us-ascii?Q?ft3OBTLn153JERKko2xK9OQz16BRFw0qmcvuX9ZKDsJUNoz6BmhdJ0LkYnmG?=
 =?us-ascii?Q?tsLXPswQhXcnFa83CChW2aU53oKHHfLB+EeCe2ZK1s5RfaIagDBaf8RIy1k1?=
 =?us-ascii?Q?ulM9ngwNvK4OKe3l0+CWIWqCqm0aRlhd0DRsInnfik+/BmMxvIfDjk41amh4?=
 =?us-ascii?Q?hyiUk8JUegwphU1l1EcngRocogOi7R98yp/tHMLdI9WybULZzPW9V6bWz0X8?=
 =?us-ascii?Q?jqwbYQpkgo/cYyL9hZ/hHKSCLuDmJZoNYNwzj2rF6rp3mMLil18NSm+HKwuO?=
 =?us-ascii?Q?W+goSn23mhbDwMTpenNGHfRxrBBHT8GDB0MdNyJwt9800TbOW8RcWNJ8xG2Q?=
 =?us-ascii?Q?W59jCF1UD9aM58EEbPVcSH/MKwM5PftJqCfkbzhM3/o60W1Vxanz1fR3Ss+r?=
 =?us-ascii?Q?deSISqpi60BZ6KTFgL6gXQhxjF8YdBfdN0+1obx+6gnWk/JMQEIEFiNzse/q?=
 =?us-ascii?Q?Bfwk/WrepXwUN4e2ucw5dSSIqFdW9JvHXS/4ltqQ568jZBLTx1sSRt1HN++N?=
 =?us-ascii?Q?vTLd8Wfv09x3/BDxl1Wvx3lZ4J7vsZHx/pJ7KGGXGh1KKlpYFmmhxcP8tABV?=
 =?us-ascii?Q?o3VOvFDsYVHRq6imOqJk5QNuorw0lXUoeLIem6zOFwKHwf4/V6VOsL/K/xZP?=
 =?us-ascii?Q?An/0EZN+AkCt2oQmTK6XZJfUZvzuPOZu17mIBrEgGR/OkYOoxPIMhTXr19qz?=
 =?us-ascii?Q?xpWsGh5rCc13zfNGqRfHNye+Cq4hgDTQpap4kHNHyLXR2VGdUtn6Dxc63DWX?=
 =?us-ascii?Q?p837L0GKNRMepr7gkYMoYhVHNRePlFibsA1La1dkedmkVrc7iVrlB6i/jWIb?=
 =?us-ascii?Q?xqn6Hl6OsngUNWKB+ivKVJo9mX4Wt95veQdwG65HNlRYHQlgleNYTh8FUot9?=
 =?us-ascii?Q?qUcFGWzxIGYizP7HHhLh31zVUqk/6NBuODE5tQJ9zhk7li4rIvTthPRz8xir?=
 =?us-ascii?Q?DP3NEYDXxYpfJ0wqC2OVGAjQrYZaHJQr3A3pZMbCs/piNZQKQptO/6Rzg8D9?=
 =?us-ascii?Q?cWIp+R3MfMhZ23J/Uf8LVD8ZgHhwU6QEjbVeSdu9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b90efc-89bf-4289-adf1-08ddafcd21d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 07:36:12.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnHoYyRmFymDNdvgvlRnDhsw+NmeKUivqQrd1KDcWBNZwRvwiStJw/gRIo7VVNaEiG1/TOywEJRlYKVroQu53g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9223

On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
>Hi all,
>
>This series adds a new counter to the Arm SCMI firmware driver to track
>the number of in-flight message transfers during debug and trace. This
>will be useful for examining behaviour under a large load with regards
>to concurrent messages being sent and received. As the counter only gives
>a live value, printing the value in trace allows logging of the in-flight
>xfers.

Just a general question, is this counter count in flight messages
for a scmi instance or it is per transport? I ask because 
one scmi instance could have multiple mailboxes. If counting based
on scmi instance, it may not be that accurate.

Thanks,
Peng

>
>The series is divided into four small patches:
>Patch [1/4]
>	- Adds a fuction to decrement debug counters, similar to the existing
>	  counter to increment debug counters
>Patch [2/4]
>	- Adds a new xfers_inflight debug counter to track active transfers
>Patch [3/4]
>	- Enhances two tracepoints (scmi_xfer_begin and scmi_xfer_end) to
>	  include the number of in-flight transfers, setting default values
>	  of 0
>Patch [4/4]
>	- Adds a function (scmi_inflight_count) that retrieves the current
>	  in-flight count for use in tracing
>
>Based on v6.16-rc2
>
>Regards,
>Phil
>
>Philip Radford (4):
>  firmware: arm_scmi: Add debug decrement counter
>  firmware: arm_scmi: Add xfer_inflight counter
>  include: trace: Add inflight_xfer counter tracepoint
>  firmware: arm_scmi: Add new inflight tracing functionality
>
> drivers/firmware/arm_scmi/common.h   |  8 ++++++++
> drivers/firmware/arm_scmi/driver.c   | 28 ++++++++++++++++++++++++++--
> drivers/firmware/arm_scmi/raw_mode.c |  6 ++++--
> include/trace/events/scmi.h          | 24 ++++++++++++++----------
> 4 files changed, 52 insertions(+), 14 deletions(-)
>
>--
>2.25.1
>
