Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC7284B33;
	Tue, 10 Jun 2025 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555484; cv=fail; b=F/cBG2KngeAa+0GzZApierfTdY0XHWxt140LmkBz1Tkx6nF/GDTHbDcadnzlY/l1eqh+IkRAh1ky92bGSBaggGud9snbm502sU2g5Q5PAtJ9iPTjVFdxAic/vUY+6qVwyM6bhjcoku72HOsCCreKPYaNFi+QX5M0Oo5MbH6dfko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555484; c=relaxed/simple;
	bh=SL/hrWeUKqKoXCspKW3+9ap3vlUJ5xlQBClRYtjxDA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H6lf/+0TxGpxPVGXPZbQxAZUkBu8xbW4m3AftCe9cdIX/FcPww2BAUB3Crg1A6How8z+5mZoWHn76l4SyfwrJXzx4hhA6hoIRiMuc1z9fvNmGrsy2Ov1HApLNcJYAiqSuUirMlmZ4iBI00nEmLX0+oAd4YUJ70Ok36PATZt/1v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fvvp3iYf; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fvvp3iYf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIphlYdraIbEeiFl3bz5Xf7Gng1dBbuJjhT+BY9M43OJ8t885zPBJT4W1YXz1+qH7aZ/FMCZ9z+Gf3wC8VHhf+IoMN+LzKkLmeNOKPSJ95NRnzrPqmlZoaYVMaTXNfV0/iKlxH75dY1WSV4U4c2tYMqQ2FFT6yZPp/FQ9ujpksR+fzIphCoTrFHTqp/6+bYbyxDYcXJRUpM0PcwrnlzuFx0sJtNYkyzgJAywMUgonfAIoNDI0t5J1w8Wl1zfUGb/4XAhfWJZ/xmIZEoE6NnpUORrhyDFu86iXQ5Gltaij66H7V7qdR7UlEGh99qtkPq3rOmBmxufrKsd5aJ/48auXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4/7YcHOJk8pcgCRAPXwjfzMSoGswYVFHcG8wx1J9Ps=;
 b=UlcAkOtZSASrAhl1j3qcIPVT/ir6UNLeBKLptToLnkG4qVAtFwdcvs2ApBMQ+NN7tIXtcCqWbpKscd4MD9QC5FRyQ48ugNkBqOF+mRJAnFEYXXro2BY3honBJ56GW5To5NgrSqtArwnX0FnOfEMwkW7xTDlWDj5nFZEY6P6arKn8XuvEHpGsZmk5pL/vnBvZ8naGWn5PcvvJF/SHoE3st5OmQvsrpsDi7u+qqTOlrvpYAZdLQC3kYc4r9pKfKAUdmF5RBlwVMvWR3eEoFySLYKc/RjLJoBfhfTKovdbp5DyfoLz3lTUwglcBq21riNp8qb44WgOiGnZmhOQWHNz9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4/7YcHOJk8pcgCRAPXwjfzMSoGswYVFHcG8wx1J9Ps=;
 b=Fvvp3iYf7cG1UhEJzn1eGjIMXOKz8tVtiZ1G2AYE70UohmQjOuPyHr3P5K+2tCfKZ0h9LHCNEr66nD2nZVoOc4Z8IdZohBGwal3IvrCBBmcVWXZpMf2zw4XdqD2jMyr8GF4Fi5Zjcga0+jOAk3ykzqUXk7lxAIsMKoYFcGTLx3e3QD7O+WQSB3X1XEWoV8+RzkAO+DX/2k1+UM2WkF68YXJWR3kZTFDurLoFIR5ByFn4zUm8oTyVj2UEWz26rkZiwQPQ9BwdfvhKroXFSjVjDDfzySGAYPVia/N3iwD2vVyLuBw3SPrBuE/lo3LND7dRnvbMJWAHr1FC9xR5g0lr/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8476.eurprd04.prod.outlook.com (2603:10a6:102:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 11:37:59 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8813.021; Tue, 10 Jun 2025
 11:37:58 +0000
Date: Tue, 10 Jun 2025 19:33:19 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: John Ernberg <john.ernberg@actia.se>, Shawn Guo <shawnguo2@yeah.net>, 
	Shawn Guo <shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <l6bupsg2vk7uvajhd4gkrqbh5eomlgldnljcy3r6acddfxdmkm@56bseizyfkqr>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
 <20250610021243.GA1610560@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610021243.GA1610560@nchen-desktop>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 89796644-2225-409c-243c-08dda8133f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MlS1/yZmUUi6N7IjNrX7D4gV6AUGqPS29/mZYxNAguVOeQEYAdLHswnhgg+j?=
 =?us-ascii?Q?1GkkarkqROb+yoMVVIsceKF6lY8oQsw+GK3jWheTKtPnen6D++3GVc5fh6NK?=
 =?us-ascii?Q?xwG3ybRNGGLQM2NXCSqWgledMjlZZW/QkalxDuDc01tNxwRr1Q0AVinhAg79?=
 =?us-ascii?Q?LmpEALhQB4nbiqSYYPCtNXMj13lYykVUjZyzoxJpUY/2LFTmsfiyIUbVWvAm?=
 =?us-ascii?Q?OufqOcVkWLoR6rCV8NzDWqN+6WfatBBhpiZWH3g5zvJLRmpvvJCRN+Ozyoh2?=
 =?us-ascii?Q?AZiKTN+hERBOJC8lZhsxQAeUrP/+eQbd+s1fxwHv4YRZsPw0dzyNabayWdy1?=
 =?us-ascii?Q?XrnUncFQV226MYLMo1+JoFrlbVROvTYqdHzsURTh27WQgI76qWMy8HiKtQQ2?=
 =?us-ascii?Q?aCzfNptftWGOtcuLQhl//JWMsBTryweerLFxA/VGlLP+0axKLbPOjNErmnpa?=
 =?us-ascii?Q?SHfk1l9eY1UFAqp/vQKZzfyHCB+w7nntS3IEUyZjCaFRPyiQtkTbWjEreEjH?=
 =?us-ascii?Q?vzJ3kL4LZH3Eto7iWecNzE/E0dA5iLZFXghiNFvyFUHdV0tlYWaR92b1CG3n?=
 =?us-ascii?Q?ed7FqeOxrO0rlG1IEn0RP1NMVcyQhfa6wzXnVuxSkVt8gs9ogq+DMOk9eoxf?=
 =?us-ascii?Q?cTLJqgBma/jMe1n/JIxeOnVTpMgKKYsbAQq5PbB3/Se2sRNPVRGPAyzGhJTY?=
 =?us-ascii?Q?HeD5RmC4EY32CLp7hy/Ro82p/2RVFI695zUR0VpN85qX5hYHV+X/C6mgtE5E?=
 =?us-ascii?Q?88L87RTBWi8lvW/iN+WY6FhhA2xC3sEq46eiZLJN8jWxzXENlaJqt6wne5w6?=
 =?us-ascii?Q?Y8aeqK0aZpAWPtnvEPRucgBDj7a3+Aoar2axf0l4km7hR7wSJlZqWp+YwP0m?=
 =?us-ascii?Q?7uDnkKzL1anRNqpboy8qAtLgRP+GoTQEEDwjwWNKzJagRyLZgO/7LJFT5+zX?=
 =?us-ascii?Q?omrBWih6l9ONATr6SKDpfnYX8vGzuN8x9TdgEgfMEHoiD3zcYSHXV4pHR1pf?=
 =?us-ascii?Q?92OhBUWVwU2w+kBhojqjFmvOc98xtprqADIbfCvcogn4uV8ks6+vt703Glrp?=
 =?us-ascii?Q?/Chy4jxM/uSGpqURUQ3+KRmclJDIp02SicIDn6D6XFJe61jAa3lBMg4cel+v?=
 =?us-ascii?Q?e1UwzpZU6aqbT8xgkWYpuKq77FUYQIDkk13D+JrOfbM0gehdjcdJwWdT+reE?=
 =?us-ascii?Q?cHGPmYAcg+uwbhU6k1iMRnYLR0YSa9nMVYjhtgVGJec9kB5x/p19glo60U6/?=
 =?us-ascii?Q?4ob2kQQLnLlqcRmJBY/q2xEZSvEWhds3KGC3IMaB20btjsO7DBXcqY4nPggy?=
 =?us-ascii?Q?YHzEhfIOlw+B1HhXFmF6uSi3gJQb5u60AHpTWqMshjmFGFHEl0JXKELtXcIV?=
 =?us-ascii?Q?XplrmnVarA18d30M4b3zgNGeXRWNKZ64GhmcDrwDqD65CoTWzrhNdLyRXXGK?=
 =?us-ascii?Q?OybZcAP54T9xVc2dKzYV4HMLUq6tmRwu99TwLblFfN/Eq/kJ1Oe0n2lX7qrK?=
 =?us-ascii?Q?YDfD+/Nv4PeTbAs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kJ2cuP6C0xkokzYYaEXA7Ivz6jxBYHIuevCyuSAxNhfXM+MWwqgxBfUEAESv?=
 =?us-ascii?Q?0B4h1RrgZweCtjDpyc/8FjslG5R0gq+8f1CeIJeJtnDtoF93d7mAnw3Rwp1K?=
 =?us-ascii?Q?ElTjAG+MuKVlW2o3pySr56VNVA393WuvLC0O9K04+XoF232k8pmVYMpYlN9Z?=
 =?us-ascii?Q?tGZHe5MUd2pLctMWodKleYOvbuOyKdkiUEHSQR5LaMUFqi/Om+YUaDb/ahnz?=
 =?us-ascii?Q?HHp39UH4BPJTdS8vQswHE9TQj4RtEK3U3Yjr8dB7bAkiewC59pWjWmGe49TM?=
 =?us-ascii?Q?2d+HLz980nqerRcv588WD3RglQ7Ewwe/W2SGUU1LqvjKhININEW8MPN8t07/?=
 =?us-ascii?Q?kX2wo4GWiVlW3zNClSIQh47+DZUuDn++HNrbPmX978LggOpbcYg5rHsK+c5r?=
 =?us-ascii?Q?2XVRVjGcAgUDKGH0ACVt+OKbIk3UjP/sdRdyjKTqFO4LKaVAXVqOoy0HnTW+?=
 =?us-ascii?Q?7wvQZDSqoOKDTKinTb9M39CDMaW9aLd3xN544eHjchPv60AY4JGjehWi+DCc?=
 =?us-ascii?Q?H72bLXvIW/Swcns4iS15+t/INgS1QL71IMSHH4bOsrI99Vn/st4oJ4bsNpX/?=
 =?us-ascii?Q?emuMXOx2vgIDuo3TULrI1TCogwyQZRQOk13DjJrSsJbxzdyjgk94rU3e8aBQ?=
 =?us-ascii?Q?iTaNO885veLtGEu2nf2w2LZHv3j5MAp1Qc7ycEInPt3cI8Afi5HZ8RTZrKIr?=
 =?us-ascii?Q?Bcc09edkng8xucV5aWbcc68mi7Y+3znVW+H5t9meWpR9w7DHjctmMEmSDXVY?=
 =?us-ascii?Q?MosNFnpN36FbyGXpHzlmsvDTAH+Lz6+yvp8r2zGaht+HQWIheO9QwgSZrQBm?=
 =?us-ascii?Q?pjzB12lerF65a/nRr4Bw+JR73bajTZuP7Pa6JD3MQaq2rOy5rqf/TwQnTdEJ?=
 =?us-ascii?Q?nCy5HEGjyZ43HTixcI3YsNW4fbC4BQqtcqFRyzIdGPlLQTWZp1PTtCO+1zNc?=
 =?us-ascii?Q?rmyhtKHjEWXr3eU1IbPPHlk2Hvix7DRPB4S4Uhyolfl5cL8n2gUcPjeDpB6L?=
 =?us-ascii?Q?mpbfBB4uWF+myyoJ39CXgbQeCpsqAUCKW+f79vkvDoq6uTlVAV/+kc6mgwZj?=
 =?us-ascii?Q?YqX/6R4pZyT3yTwXnMa1WxyAKnWnUSur0n3MUPrC/QKe5ecBJMQstaMTcvKO?=
 =?us-ascii?Q?dQPCLDXUzQNoK8TAtjb1zOklqB+A9JVuhi+Yb8C7Nf83CtmtkJQADcLabdls?=
 =?us-ascii?Q?wC10oBrwpSAc8ME4fkQVAwdI0yrzIGOqB8I4FD1H8VT4HOt7KvVTgSpQvoZS?=
 =?us-ascii?Q?AvEQkbkY1B/1CxNNfpLxYYwVn9dh+SSOZgIA17f4Iexn1p92/b+zqiKTHk6a?=
 =?us-ascii?Q?+Xzr7E5UuQwBTdJ0ge8rAakhJDDdXoVGThRz9ahJDhXYB9lvEi9gmOJ9cGIo?=
 =?us-ascii?Q?/5kUFK0Sx+hhAWhhX/kV8GvOz0k+OKl9+PJne///DDIVEfSJRLsKR6ptjYEO?=
 =?us-ascii?Q?pMznfbhh87zUfwWqoafWxws/SIx7A+YYcsplBeJq7/3dVaTY9AM494BWpHi7?=
 =?us-ascii?Q?09M+03aO0WO1eIosaVRgWYG+wQrH4duGAkjCCHX4eBNlUm+W6HvGf169/7Xq?=
 =?us-ascii?Q?Y0S1i1LA0lKKtxyTvcn01JH/3RG7HJECYQed926H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89796644-2225-409c-243c-08dda8133f6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:37:58.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0iRc27y9cw4WvL2cxaLlio3yXwdvrQNli0jzRGZWjaF6CY/XqcdIw76cNVHMZvaiCHd8/GhdBQU+7ADMMKJmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8476

On Tue, Jun 10, 2025 at 10:12:43AM +0800, Peter Chen (CIX) wrote:
> On 25-06-09 14:17:30, John Ernberg wrote:
> > Hi Shawn, Xu,
> > 
> > On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> > > Hi Shawn,
> > > 
> > > Thanks for your reports!
> > > 
> > > On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > > > Hi Xu, Peter,
> > > > 
> > > > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > > > 
> > > >  - USB gadget is enabled as Ethernet
> > > >  - There is data transfer over USB Ethernet
> > > >  - Device is going in/out suspend
> > > > 
> > > > A simple way to reproduce the issue could be:
> > > > 
> > > >  1. Copy a big file (like 500MB) from host PC to device with scp
> > > > 
> > > >  2. While the file copy is ongoing, suspend & resume the device like:
> > > > 
> > > >     $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/state
> > > > 
> > > >  3. The device will hang up there
> > > > 
> > > > I reproduced on the following kernels:
> > > > 
> > > >  - Mainline kernel
> > > >  - NXP kernel lf-6.6.y
> > > >  - NXP kernel lf-6.12.y
> > > > 
> > > > But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down to
> > > > Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
> > > > connect calls got lost from suspend & resume hooks, when the commit were
> > > > split and pushed upstream.  I confirm that adding the calls back fixes
> > > > the hangup.
> > 
> > We probably ran into the same problem trying to bring onboard 6.12, going
> > from 6.1, on iMX8QXP. I managed to trace the hang to EP priming through a
> > combination of debug tracing and BUG_ON experiments. See if it starts
> > splatin with the below change.
> 
> Hi John and Shawn,
> 
> Like Alan and Xu's suggestion, there are probably two problems here:
> - When the system enters the suspend, the USB bus may neither at suspend
> nor disconnect state if USB controller/phy's power is not off and VBUS
> is there. So, the host still considers the device is active, it could
> trigger transfer any time. If the transfer occurs during system resume,
> the USB controller triggers interrupt to CPU, and USB's interrupt handler
> is triggered. If the USB's hardware is still at low power mode (or clock
> is gated off), it may cause system hang (CPU gets error response from USB)
> after access register.
> 
> With Shawn's change, it pulls D+ down during the suspend, and the host
> is notified of disconnection, so the host will not trigger transfer
> until D+ is pulled up by calling usb_gadget_connect. The USB leaves
> low power mode (and turn clock on) before that, the access register
> will not cause system hang.
> 
> - The current chipidea driver doesn't notify gadget driver when it
> enters system suspend routine. In fact, during system suspend/resume,
> the controller driver may not respond middle layer's (network) request 
> well due to it enters low power mode, so calling usb_gadget_driver->
> disconnect (composite_disconnect) is needed during controller's suspend
> routine, it calls function->disable for USB function driver and
> ends/stop middle layer process.

Thank you Peter! I'll improve this part later.

Best Regards,
Xu Yang

> 
> Peter
> 
> > 
> > ----------------->8------------------
> > 
> > From 092599ab6f9e20412a7ca1eb118dd2be80cd18ff Mon Sep 17 00:00:00 2001
> > From: John Ernberg <john.ernberg@actia.se>
> > Date: Mon, 5 May 2025 09:09:01 +0200
> > Subject: [PATCH] USB: ci: gadget: Panic if priming when gadget off
> > 
> > ---
> >  drivers/usb/chipidea/udc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 2fea263a5e30..544aa4fa2d1d 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -203,8 +203,10 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
> >  
> >     hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
> >  
> > -   while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
> > +   while (hw_read(ci, OP_ENDPTPRIME, BIT(n))) {
> >         cpu_relax();
> > +       BUG_ON(dir == TX && !hw_read(ci, OP_ENDPTCTRL + num, ENDPTCTRL_TXE));
> > +   }
> >     if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
> >         return -EAGAIN;
> >  
> > ----------------->8------------------
> > 
> > On the iMX8QXP you may additionally run into asychronous aborts and SError
> > due to resource being disabled.
> > 
> > > > 
> > > > ---8<--------------------
> > > > 
> > > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > > index 8a9b31fd5c89..72329a7eac4d 100644
> > > > --- a/drivers/usb/chipidea/udc.c
> > > > +++ b/drivers/usb/chipidea/udc.c
> > > > @@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
> > > >          */
> > > >         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
> > > >                 hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> > > > +
> > > > +       if (ci->driver && ci->vbus_active && (ci->gadget.state != USB_STATE_SUSPENDED))
> > > > +               usb_gadget_disconnect(&ci->gadget);
> > > >  }
> > > >  
> > > >  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > > > @@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > > >                                         OTGSC_BSVIS | OTGSC_BSVIE);
> > > >                 if (ci->vbus_active)
> > > >                         usb_gadget_vbus_disconnect(&ci->gadget);
> > > > +       } else {
> > > > +               if (ci->driver && ci->vbus_active)
> > > > +                       usb_gadget_connect(&ci->gadget);
> > > >         }
> > > >  
> > > >         /* Restore value 0 if it was set for power lost check */
> > > > 
> > > > ---->8------------------
> > > 
> > > During the scp process, the usb host won't put usb device to suspend state.
> > > In current design, then the ether driver doesn't know the system has
> > > suspended after echo mem. The root cause is that ether driver is still tring
> > > to queue usb request after usb controller has suspended where usb clock is off,
> > > then the system hang.
> > > 
> > > With the above changes, I think the ether driver will fail to eth_start_xmit() 
> > > at an ealier stage, so the issue can't be triggered.
> > > 
> > > I think the ether driver needs call gether_suspend() accordingly, to do this,
> > > the controller driver need explicitly call suspend() function when it's going
> > > to be suspended. Could you check whether below patch fix the issue?
> > > 
> > >  ---8<--------------------
> > > 
> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > index 8a9b31fd5c89..27a7674ed62c 100644
> > > --- a/drivers/usb/chipidea/udc.c
> > > +++ b/drivers/usb/chipidea/udc.c
> > > @@ -2367,6 +2367,8 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
> > >  #ifdef CONFIG_PM_SLEEP
> > >  static void udc_suspend(struct ci_hdrc *ci)
> > >  {
> > > +       ci->driver->suspend(&ci->gadget);
> > > +
> > >         /*
> > >          * Set OP_ENDPTLISTADDR to be non-zero for
> > >          * checking if controller resume from power lost
> > > @@ -2389,6 +2391,8 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > >         /* Restore value 0 if it was set for power lost check */
> > >         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0xFFFFFFFF)
> > >                 hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
> > > +
> > > +       ci->driver->resume(&ci->gadget);
> > >  }
> > >  #endif
> > > 
> > >  ---->8------------------
> > 
> > I tested this during my debugging and it doesn't work because suspend/resume
> > callbacks on the gadgets are designed for USB triggered suspend/resume and
> > not system triggered suspend/resume. Meaning that the link will just be
> > woken up again by the next USB transfer.
> > 
> > > 
> > > Thanks,
> > > Xu Yang
> > > 
> > > > 
> > > > But it's unclear to me why the hangup happens and how the change above
> > > > fix the problem.  Do you guys have any insight here?o
> > > > 
> > > > Shawn
> > > > 
> > > > [1] https://github.com/reMarkable/linux-imx/commit/0791d25578cb0e46fd93ae7a3c36ff7a424f3547
> > > > 
> > 
> > I didn't find the missing lines of code that Shawn found and instead ended
> > up looking at why the UDC core isn't suspending the gadgets when the system
> > is going to suspend. Because to me it feels like a job of UDC core.
> > 
> > I ended up with the monstrosity below that I have been intended to send as
> > an RFC when I'm done thinking about it. It currently applies on 6.12.20.
> > 
> > But since Shawn also ran into the problem I'm including it for the sake of
> > discussion about what the correct path of solving it is.
> > 
> > Best regards // John Ernberg
> > 
> > ----------------->8------------------
> > 
> > From 3c1d167f1eff0bd010b797530e3d03f6939db322 Mon Sep 17 00:00:00 2001
> > From: John Ernberg <john.ernberg@actia.se>
> > Date: Mon, 5 May 2025 09:09:50 +0200
> > Subject: [PATCH] WIP: Suspend getherlink on system suspend
> > 
> > ---
> >  drivers/usb/gadget/composite.c        | 68 +++++++++++++++++++++++++++
> >  drivers/usb/gadget/configfs.c         | 53 +++++++++++++++++++++
> >  drivers/usb/gadget/function/f_ecm.c   | 22 +++++++++
> >  drivers/usb/gadget/function/u_ether.c | 34 ++++++++++++++
> >  drivers/usb/gadget/function/u_ether.h |  2 +
> >  drivers/usb/gadget/udc/core.c         | 29 ++++++++++++
> >  include/linux/usb/composite.h         |  4 ++
> >  include/linux/usb/gadget.h            |  2 +
> >  8 files changed, 214 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> > index 8402a86176f4..f1ed1db1e1d0 100644
> > --- a/drivers/usb/gadget/composite.c
> > +++ b/drivers/usb/gadget/composite.c
> > @@ -2669,6 +2669,72 @@ void composite_resume(struct usb_gadget *gadget)
> >  	cdev->suspended = 0;
> >  }
> >  
> > +int composite_system_suspend(struct usb_gadget *gadget)
> > +{
> > +	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
> > +	struct usb_function		*f;
> > +	int				ret;
> > +
> > +	DBG(cdev, "system suspend\n");
> > +	if (cdev->config) {
> > +		list_for_each_entry(f, &cdev->config->functions, list) {
> > +			if (f->system_suspend) {
> > +				ret = f->system_suspend(f);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +		}
> > +	}
> > +
> > +	if (cdev->config &&
> > +	    cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER)
> > +		usb_gadget_set_selfpowered(gadget);
> > +
> > +	usb_gadget_vbus_draw(gadget, 2);
> > +
> > +	return 0;
> > +}
> > +
> > +int composite_system_resume(struct usb_gadget *gadget)
> > +{
> > +	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
> > +	struct usb_function		*f;
> > +	unsigned			maxpower;
> > +	int				ret;
> > +
> > +	DBG(cdev, "system resume\n");
> > +	if (cdev->config) {
> > +		list_for_each_entry(f, &cdev->config->functions, list) {
> > +			if (f->system_resume) {
> > +				ret = f->system_resume(f);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +		}
> > +
> > +		maxpower = cdev->config->MaxPower ?
> > +			cdev->config->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
> > +		if (gadget->speed < USB_SPEED_SUPER)
> > +			maxpower = min(maxpower, 500U);
> > +		else
> > +			maxpower = min(maxpower, 900U);
> > +
> > +		if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW ||
> > +		    !(cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
> > +			usb_gadget_clear_selfpowered(gadget);
> > +		else
> > +			usb_gadget_set_selfpowered(gadget);
> > +
> > +		usb_gadget_vbus_draw(gadget, maxpower);
> > +	} else {
> > +		maxpower = CONFIG_USB_GADGET_VBUS_DRAW;
> > +		maxpower = min(maxpower, 100U);
> > +		usb_gadget_vbus_draw(gadget, maxpower);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /*-------------------------------------------------------------------------*/
> >  
> >  static const struct usb_gadget_driver composite_driver_template = {
> > @@ -2681,6 +2747,8 @@ static const struct usb_gadget_driver composite_driver_template = {
> >  
> >  	.suspend	= composite_suspend,
> >  	.resume		= composite_resume,
> > +	.system_suspend	= composite_system_suspend,
> > +	.system_resume	= composite_system_resume,
> >  
> >  	.driver	= {
> >  		.owner		= THIS_MODULE,
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > index 29390d573e23..e0d2f0998e86 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -1962,6 +1962,57 @@ static void configfs_composite_resume(struct usb_gadget *gadget)
> >  	spin_unlock_irqrestore(&gi->spinlock, flags);
> >  }
> >  
> > +static int configfs_composite_system_suspend(struct usb_gadget *gadget)
> > +{
> > +	struct usb_composite_dev *cdev;
> > +	struct gadget_info *gi;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	cdev = get_gadget_data(gadget);
> > +	if (!cdev)
> > +		return 0;
> > +
> > +	gi = container_of(cdev, struct gadget_info, cdev);
> > +	spin_lock_irqsave(&gi->spinlock, flags);
> > +	cdev = get_gadget_data(gadget);
> > +	if (!cdev || gi->unbind) {
> > +		spin_unlock_irqrestore(&gi->spinlock, flags);
> > +		return 0;
> > +	}
> > +
> > +	ret = composite_system_suspend(gadget);
> > +	spin_unlock_irqrestore(&gi->spinlock, flags);
> > +
> > +	return ret;
> > +}
> > +
> > +static int configfs_composite_system_resume(struct usb_gadget *gadget)
> > +{
> > +	struct usb_composite_dev *cdev;
> > +	struct gadget_info *gi;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	cdev = get_gadget_data(gadget);
> > +	if (!cdev)
> > +		return 0;
> > +
> > +	gi = container_of(cdev, struct gadget_info, cdev);
> > +	spin_lock_irqsave(&gi->spinlock, flags);
> > +	cdev = get_gadget_data(gadget);
> > +	if (!cdev || gi->unbind) {
> > +		spin_unlock_irqrestore(&gi->spinlock, flags);
> > +		return 0;
> > +	}
> > +
> > +	ret = composite_system_resume(gadget);
> > +	spin_unlock_irqrestore(&gi->spinlock, flags);
> > +
> > +	return ret;
> > +}
> > +
> > +
> >  static const struct usb_gadget_driver configfs_driver_template = {
> >  	.bind           = configfs_composite_bind,
> >  	.unbind         = configfs_composite_unbind,
> > @@ -1972,6 +2023,8 @@ static const struct usb_gadget_driver configfs_driver_template = {
> >  
> >  	.suspend	= configfs_composite_suspend,
> >  	.resume		= configfs_composite_resume,
> > +	.system_suspend	= configfs_composite_system_suspend,
> > +	.system_resume	= configfs_composite_system_resume,
> >  
> >  	.max_speed	= USB_SPEED_SUPER_PLUS,
> >  	.driver = {
> > diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
> > index 6cb7771e8a69..4df67d5ee0fa 100644
> > --- a/drivers/usb/gadget/function/f_ecm.c
> > +++ b/drivers/usb/gadget/function/f_ecm.c
> > @@ -892,6 +892,26 @@ static void ecm_resume(struct usb_function *f)
> >  	gether_resume(&ecm->port);
> >  }
> >  
> > +static int ecm_system_suspend(struct usb_function *f)
> > +{
> > +	struct f_ecm *ecm = func_to_ecm(f);
> > +	struct usb_composite_dev *cdev = ecm->port.func.config->cdev;
> > +
> > +	DBG(cdev, "ECM System Suspend\n");
> > +
> > +	return gether_system_suspend(&ecm->port);
> > +}
> > +
> > +static int ecm_system_resume(struct usb_function *f)
> > +{
> > +	struct f_ecm *ecm = func_to_ecm(f);
> > +	struct usb_composite_dev *cdev = ecm->port.func.config->cdev;
> > +
> > +	DBG(cdev, "ECM System Resume\n");
> > +
> > +	return gether_system_resume(&ecm->port);
> > +}
> > +
> >  static void ecm_free(struct usb_function *f)
> >  {
> >  	struct f_ecm *ecm;
> > @@ -961,6 +981,8 @@ static struct usb_function *ecm_alloc(struct usb_function_instance *fi)
> >  	ecm->port.func.free_func = ecm_free;
> >  	ecm->port.func.suspend = ecm_suspend;
> >  	ecm->port.func.resume = ecm_resume;
> > +	ecm->port.func.system_suspend = ecm_system_suspend;
> > +	ecm->port.func.system_resume = ecm_system_resume;
> >  
> >  	return &ecm->port.func;
> >  }
> > diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> > index f58590bf5e02..d4f0e28ffd4d 100644
> > --- a/drivers/usb/gadget/function/u_ether.c
> > +++ b/drivers/usb/gadget/function/u_ether.c
> > @@ -1078,6 +1078,40 @@ void gether_resume(struct gether *link)
> >  }
> >  EXPORT_SYMBOL_GPL(gether_resume);
> >  
> > +int gether_system_suspend(struct gether *link)
> > +{
> > +	struct eth_dev *dev = link->ioport;
> > +	struct net_device *ndev = dev->net;
> > +
> > +	rtnl_lock();
> > +	if (netif_running(ndev)) {
> > +		netif_tx_lock_bh(ndev);
> > +		netif_device_detach(ndev);
> > +		netif_tx_unlock_bh(ndev);
> > +	}
> > +	rtnl_unlock();
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(gether_system_suspend);
> > +
> > +int gether_system_resume(struct gether *link)
> > +{
> > +	struct eth_dev *dev = link->ioport;
> > +	struct net_device *ndev = dev->net;
> > +
> > +	rtnl_lock();
> > +	if (netif_running(ndev)) {
> > +		netif_tx_lock_bh(ndev);
> > +		netif_device_attach(ndev);
> > +		netif_tx_unlock_bh(ndev);
> > +	}
> > +	rtnl_unlock();
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(gether_system_resume);
> > +
> >  /*
> >   * gether_cleanup - remove Ethernet-over-USB device
> >   * Context: may sleep
> > diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
> > index 34be220cef77..ffd023b7be7b 100644
> > --- a/drivers/usb/gadget/function/u_ether.h
> > +++ b/drivers/usb/gadget/function/u_ether.h
> > @@ -261,6 +261,8 @@ void gether_cleanup(struct eth_dev *dev);
> >  
> >  void gether_suspend(struct gether *link);
> >  void gether_resume(struct gether *link);
> > +int gether_system_suspend(struct gether *link);
> > +int gether_system_resume(struct gether *link);
> >  
> >  /* connect/disconnect is handled by individual functions */
> >  struct net_device *gether_connect(struct gether *);
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> > index 4b3d5075621a..1e4ee5ffcfbf 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -1683,6 +1683,30 @@ static void gadget_unbind_driver(struct device *dev)
> >  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
> >  }
> >  
> > +static int gadget_suspend_driver(struct device *dev)
> > +{
> > +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> > +	struct usb_udc *udc = gadget->udc;
> > +	struct usb_gadget_driver *driver = udc->driver;
> > +
> > +	if (driver->system_suspend)
> > +		return driver->system_suspend(gadget);
> > +
> > +	return 0;
> > +}
> > +
> > +static int gadget_resume_driver(struct device *dev)
> > +{
> > +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> > +	struct usb_udc *udc = gadget->udc;
> > +	struct usb_gadget_driver *driver = udc->driver;
> > +
> > +	if (driver->system_resume)
> > +		return driver->system_resume(gadget);
> > +
> > +	return 0;
> > +}
> > +
> >  /* ------------------------------------------------------------------------- */
> >  
> >  int usb_gadget_register_driver_owner(struct usb_gadget_driver *driver,
> > @@ -1896,11 +1920,16 @@ static const struct class udc_class = {
> >  	.dev_uevent	= usb_udc_uevent,
> >  };
> >  
> > +static const struct dev_pm_ops gadget_bus_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(gadget_suspend_driver, gadget_resume_driver)
> > +};
> > +
> >  static const struct bus_type gadget_bus_type = {
> >  	.name = "gadget",
> >  	.probe = gadget_bind_driver,
> >  	.remove = gadget_unbind_driver,
> >  	.match = gadget_match_driver,
> > +	.pm = &gadget_bus_pm_ops,
> >  };
> >  
> >  static int __init usb_udc_init(void)
> > diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
> > index 6e38fb9d2117..f42ba1cfd181 100644
> > --- a/include/linux/usb/composite.h
> > +++ b/include/linux/usb/composite.h
> > @@ -226,6 +226,8 @@ struct usb_function {
> >  					bool config0);
> >  	void			(*suspend)(struct usb_function *);
> >  	void			(*resume)(struct usb_function *);
> > +	int			(*system_suspend)(struct usb_function *);
> > +	int			(*system_resume)(struct usb_function *);
> >  
> >  	/* USB 3.0 additions */
> >  	int			(*get_status)(struct usb_function *);
> > @@ -522,6 +524,8 @@ extern int composite_setup(struct usb_gadget *gadget,
> >  		const struct usb_ctrlrequest *ctrl);
> >  extern void composite_suspend(struct usb_gadget *gadget);
> >  extern void composite_resume(struct usb_gadget *gadget);
> > +extern int composite_system_suspend(struct usb_gadget *gadget);
> > +extern int composite_system_resume(struct usb_gadget *gadget);
> >  
> >  /*
> >   * Some systems will need runtime overrides for the  product identifiers
> > diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> > index df33333650a0..8cdfdece1561 100644
> > --- a/include/linux/usb/gadget.h
> > +++ b/include/linux/usb/gadget.h
> > @@ -744,6 +744,8 @@ struct usb_gadget_driver {
> >  	void			(*disconnect)(struct usb_gadget *);
> >  	void			(*suspend)(struct usb_gadget *);
> >  	void			(*resume)(struct usb_gadget *);
> > +	int			(*system_suspend)(struct usb_gadget *);
> > +	int			(*system_resume)(struct usb_gadget *);
> >  	void			(*reset)(struct usb_gadget *);
> >  
> >  	/* FIXME support safe rmmod */
> 
> -- 
> 
> Best regards,
> Peter
