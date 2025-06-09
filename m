Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A61248F69;
	Mon,  9 Jun 2025 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470288; cv=fail; b=Egnp/3/B3WJ8rOCCtDSqFV6y4w8igeAf1gCUQHTa+DBJ8XEESKTuvjYVDLWiS58HHvRQsUiOwZk2och59LI+QTQtwFhA+M5U5Gsj2M3nnC/mm4dlBvPZq/kw4AWi2gu/hQTAwoPpzx7TSnxx8s7hueXVd596koX6NrHbigpXg6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470288; c=relaxed/simple;
	bh=PGn/XYFVX9TQCDJceSixgoCfVanmSRRNWFiDM0XJ/7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ejHti6IDaR3YIbqPl6qFQArfp88Qq/irgiP0MtVuqYZlxGhWNdoPPy10yj336ylsNFpXoCWaOCIyA2sakdfAXujI+tL7zERTmrVo4FwK0aFLlgYT6w36WSqtvBPoQPuPdf1v57IJESpXBpKFR9jNEMTbzYS6sRsv/QvqnVMzAa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V7NUp+gl; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V7NUp+gl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEc80ixdrJ9isltQxcrdn3ecLAvswUjOsT6nX6nB4FI+/ZvBxgahms5WIHW8Htp3/FFplpYRkpugDDMEY7GoeS4uaLaq7nQVYJ9IuWre6EldVV0inK5OdlCrn7eq4HPIiJZehTI1k6o+KdyCvsgCtek3H2Iv10iyCa6dky2nj6WGy2ye2IqqPNUv4kVqXB+8bhtbl3RLnn0FsEXMxVzbEkpiAcJLbYyVuKyFJW0VX97N3NFC2IPVpqCdUzvJKsk1gD4PqYzb1Z88rgvgOIbnQtk86MD1QTkJ+Rz6jEfGAKvaApSOhdBlvUVt4RjQXijUoWSYIZEz42HzEvgFCHsnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bt7aPwqNnbt46+ICpdjUxpXtjsr23ed6oMmaQmNrjmU=;
 b=QYwX9vXNRSFWrNA4Cv9xWgXx5dU2Jkp3lU/Rnv6culuFnc2aLSzLO6OB7EL7w29MIljk6CLVIyS8LncPnOQCD9ppQZND9f8MxYKCVV3qlVvo0i9rm4M4M2LjEU72nB89Uuo7RY6iqEeUmPYX3l4apfdlYrkC6x+GEXOdwsMOEwmsuAuOgKDOx6VS5I9wuf6YE94zG7Wh8ddjrkDN/3aNvPJ2E/oVr8LFBlQ+gBBg/WUb+Ve9pJt/H06B6ylnwv2BvkNONO5rsb8vhmzOcpsh9g6USpGM9teKPYEdnnITjHF/uZnFxVEPziSc6sShUV/wxgxg8w7XeI6IP7Fvvvf6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bt7aPwqNnbt46+ICpdjUxpXtjsr23ed6oMmaQmNrjmU=;
 b=V7NUp+glKb1ut17MlB2MfeLTylkAAsbF/9N5hd1WhViJqn2MiE0e9IYjL6tTNGunkOUeNgW4L8AN21P3UqtQ92jBDsfqw7elAH60ZUMWENLwWaSrq3S2cN2YpqpvdGRID+CDV02jlhFihIjRXgrFTW4IaTiQd0Sd8udNLzuxIU25o6D2DUcClZjMg0dpgASamJxCQm5LrBSd/p3m+FMpm9ouNii5/7tvSa7Wz18KwckXck/krODZkl5/pFOprH0kI/Y6oy4eQOafyUhzUAMoCKYwKtt224XZZYErA53hHGMnG5E7h+r6UiYDc4hL5wu+vJpGuZT/8VOoqbrs/3mHhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 11:58:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8813.018; Mon, 9 Jun 2025
 11:57:59 +0000
Date: Mon, 9 Jun 2025 19:53:22 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	imx@lists.linux.dev, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
References: <aEZxmlHmjeWcXiF3@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEZxmlHmjeWcXiF3@dragon>
X-ClientProxiedBy: AM8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d64937-dff6-4125-b107-08dda74ce13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QGGtHpf21CBjGZnHWEPNLNgji4nYFKEMjvCDhXvDRS5SKve9VPeanTKay+Xl?=
 =?us-ascii?Q?dIrm0/gYLRX62vm6tEpZK1gh/O5jsBHBWl3GYSLFkv5vQ5/LUcbWGiAgMXaZ?=
 =?us-ascii?Q?ajSFbFRpoUhYXrOjo79sh+3TBHTZv68ov3jnM+9NgMjOhby0j2NGRi/hjVMe?=
 =?us-ascii?Q?HkPr7sr4WBLnoXMvwWk7qBJL414f5soEgEswvcD3b9fYXw6MKRT2x7kuIyI/?=
 =?us-ascii?Q?nWThiP2CoQMCy27VxN8vrD0kGQCRgF5DmZFdGnDxF0zZkarG4zk50iCq/XAE?=
 =?us-ascii?Q?PJ9Ap+um0hdVfjdIil7XTQb7FzKreOTiptvtiU1wl1OUfvJknxBGkmOKP1bM?=
 =?us-ascii?Q?vot9EhwykMtk+mxwDGOxYAX5q3reMlg+cra5csrjnp7UQRefM61w38TlvKR2?=
 =?us-ascii?Q?BokKW1QKjved1OXALehMsTyxBz7R3jGQ2DNCFyQbBvCF/h7dudEXCvY839Iu?=
 =?us-ascii?Q?04uIUIYeGOyyZs1xdjAdRqF7zVR/bPW6MwEaEnBg1JtpdEie32SDBVK0XNmE?=
 =?us-ascii?Q?tOOdxJxLjyTSJzOyEOsI3s/nUmA6463W6F0eITl2uC+IUi4kwl6ibBvV/iuc?=
 =?us-ascii?Q?VLKxPgx6a60A0z8Q0PwOQ3+DkClmbCCrTbt4yeYasTFNcMeLzWexfEJlAAa7?=
 =?us-ascii?Q?THUYXzEvwr7GeVReMgTw08UWLnOKY3xiQxeWy0Hfyofnswr/WajumB0lzkvP?=
 =?us-ascii?Q?VBOD+3gQaUYLESecxbQz7VDNsefW0zwiq7ykzegTeCslp+x6bkcEFa9TAsay?=
 =?us-ascii?Q?AfcomczSZvcB8zEZZBFJOm1gvkOA5EcT0rJJuX7p/YYsnIdp2UPOQsnvI+cg?=
 =?us-ascii?Q?3yYuKc79Z74emSWe8X6GGxxS3AVlFB8nDHBIZr7yiDwAgvgdRja4Zju4Lhx9?=
 =?us-ascii?Q?Y8E3Mar/ASqm/vu6LSFa/B2kUzbx61gdLNDA5jBk0aGKZH2eazSobSnjxBVY?=
 =?us-ascii?Q?iRbb1JZo6MZpzQbf5WgPHxowuns4OcNj5xOJbB3tSIH2/CyQpjqB+WYVnGfO?=
 =?us-ascii?Q?WQ5F6nxGXWY3P2UmQofFSVdlnguN7d54P1Ov7NoJOjm9ezzJp+0VMAVsjxW/?=
 =?us-ascii?Q?u/8gGxLvJDOjW6VWmCd+6SEWFjOAhYuSyulLX9cN0LwHheXPKJv8P074n+uk?=
 =?us-ascii?Q?IvpkNye8XNtuQt9pg5QWoD82fAsI0IlJAh10iQE4MdnoJgXkKpXPtb/siFUC?=
 =?us-ascii?Q?wX684vCBMUzc5Lss3vvcsPMVkwTy2irE1U9OFy99Q51iLTAibXERyZ9xBWb1?=
 =?us-ascii?Q?KwruQw93vZKtAfVTJ20EthcsbMLkhW+HWOqR0hRO/5izVu8m1cX/KpWx2z1V?=
 =?us-ascii?Q?uQanMwQE4+ohPbanniPJ1bnwFggFNcNj6ikGnWxhOoZdn3ammHd9ctyD+2Rh?=
 =?us-ascii?Q?ioK8ChZt8cKwQaF4NtspYfkwuUy2EQl0Ym7X2NKr1eRX8g3j9zJVUGF86nkz?=
 =?us-ascii?Q?j+05m9PuxizD5kLnwswtxV10+2zGJ2ul864hCCH41XUiNg53toFDKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sxFZlnEjbXGRPfjK5wt4XoozgRm9pYweKDwsM7eqVisfCIwTYIGYGoocUudr?=
 =?us-ascii?Q?0ZcE0zlrZqOxQLNEzkbW3OetRyeJihWyAkz4kXcONaC3QAVVUNhwmf7F3tq5?=
 =?us-ascii?Q?DbNE1olh8Pkb/lrR5k/U+urarqTuPEGYiYNfUOqew7xrebYlNGG/ZVjQhHox?=
 =?us-ascii?Q?H32lypp7Er5GSUe5+Zhpuc9ORuVxhrNx1/zQRuwq9yR+J07daYE5DVpU+MB2?=
 =?us-ascii?Q?pO++ZH9YC96KfnWLRfz24FGe8uuppe7JW37lND4DlZbBCmKVekJdIveudhDE?=
 =?us-ascii?Q?Tn5ITRW1tN8STK0zvgkBGDlaMwFYSUmtEK1netR3blqP7ibAmlz1/8K1Vr+j?=
 =?us-ascii?Q?9lTfYX+O5/oFX091HhJx2wHzgU7lNGL9U/022560/xUN7M4PmN12+99aWm6L?=
 =?us-ascii?Q?hKC+rELSHR9DdVWlZwvegBAeliap3zTdZNrE78/H50/MH2UqM369fGHfc3Pf?=
 =?us-ascii?Q?P/23Beam8SO8Glwaf9W+D3q1g+amW0Ro0aFpf2Cobfx8q/p1KKCCAPpYAtIQ?=
 =?us-ascii?Q?N9QuE9sog+glY/oLGzbsxS3TbUkZ7nE9XXMzGiQn3EsejkdhkQEbm735c/wS?=
 =?us-ascii?Q?lAX2Z70zVhZw/ijMIKsiY2cwdlLiLlkoEq8ghAuxj179NWtc1cx/oLPbapiy?=
 =?us-ascii?Q?IVSYMXxIcqwqW7heBgxMe/1N5BPZP7rEE+LRFZU3q0I+msDLRd5Fgk6ME9An?=
 =?us-ascii?Q?umoSW5iTzlCtirSLiLDx0gXWrFQcH6L4X7sChlb/OybpmXnOfCV4ip0nAydG?=
 =?us-ascii?Q?YsooJpzQEgmXCdJcX/ZA/e3gL6XvzD/PqDT27kIIrBrPpq2rfbCbyeyLfGtH?=
 =?us-ascii?Q?eBoBB3IxHjI+f+0goaxitFjJ/Rw7SSgrJJT4JmqsWYW92w9hAZ66JCxRd1Mv?=
 =?us-ascii?Q?sXfKcLSDyTJeiPIMv8wn86rYC6lTNzw41nKNLHmN3FCoFc3nhklHvb+RrT5g?=
 =?us-ascii?Q?HdSoj4Za9mx3BSqrZNPZA+Nh8NxoxAchryyfMs0mtq6oyzfbvCH6ZyzbHYAY?=
 =?us-ascii?Q?rJ7r9ow0BWHLVIYJVrZ248eX0PrFLbRj99F66ejifJTnVxsuS3dgiA5O44vn?=
 =?us-ascii?Q?fB0pPrpswKBgvge95n4fC+JFJFNXCsgyS/nVyjCp2fJEa/ZPBqksJ7fg9FNT?=
 =?us-ascii?Q?fCm9UdlvpOCAHV4934sfKEsUhjer7QrTYBZ8cjiAbAze8qoTP2sb8q/m4aft?=
 =?us-ascii?Q?hzpsOrAqCDH9jUSAOZDPYku6EKp9ZbuAOg/LphVme5TqdN6NSNT/1NQ+pxgb?=
 =?us-ascii?Q?6f9AtAEoLbXBuhqqOb6XeBoLBlWPH1Xnizg49EoHeJ3cESzAeFEHIpkBXCXk?=
 =?us-ascii?Q?mKJwlDBUeKsek5aZQLYPqf0PaqYCgUTyHbViOvEPoCxQNtxa/by6T+78r7WQ?=
 =?us-ascii?Q?pwgeDPoRiZSts3HpPoDB7+aTP+zwJXTA5G54LkwL6qshxP6sDMFSl6itpoTs?=
 =?us-ascii?Q?O0/202IwixhShWrgRif33Nwn4kKBWAz86Iy81ZHobXd3Tcf8dtPindwF/Zxg?=
 =?us-ascii?Q?s33k4VmiaxBSN4O9XCpEwSQt+KcbiAJSl6QXQa6R4rNtR6E+q+mcUcqWsumg?=
 =?us-ascii?Q?cLt0/9WJaAaRJDpjk07vBn216GhWitabufLLtkcI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d64937-dff6-4125-b107-08dda74ce13d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:57:59.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+VH6NMRiG1WK7ylZzRmz0OmB6+g/8ysIoWiO2yQiOeTgbL1/a8wpdCaYLtA1D/6NXbZ6tsn6q7Nypq3g9jv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399

Hi Shawn,

Thanks for your reports!

On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> Hi Xu, Peter,
> 
> I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> 
>  - USB gadget is enabled as Ethernet
>  - There is data transfer over USB Ethernet
>  - Device is going in/out suspend
> 
> A simple way to reproduce the issue could be:
> 
>  1. Copy a big file (like 500MB) from host PC to device with scp
> 
>  2. While the file copy is ongoing, suspend & resume the device like:
> 
>     $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/state
> 
>  3. The device will hang up there
> 
> I reproduced on the following kernels:
> 
>  - Mainline kernel
>  - NXP kernel lf-6.6.y
>  - NXP kernel lf-6.12.y
> 
> But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down to
> Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
> connect calls got lost from suspend & resume hooks, when the commit were
> split and pushed upstream.  I confirm that adding the calls back fixes
> the hangup.
> 
> ---8<--------------------
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 8a9b31fd5c89..72329a7eac4d 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
>          */
>         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
>                 hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> +
> +       if (ci->driver && ci->vbus_active && (ci->gadget.state != USB_STATE_SUSPENDED))
> +               usb_gadget_disconnect(&ci->gadget);
>  }
>  
>  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> @@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>                                         OTGSC_BSVIS | OTGSC_BSVIE);
>                 if (ci->vbus_active)
>                         usb_gadget_vbus_disconnect(&ci->gadget);
> +       } else {
> +               if (ci->driver && ci->vbus_active)
> +                       usb_gadget_connect(&ci->gadget);
>         }
>  
>         /* Restore value 0 if it was set for power lost check */
> 
> ---->8------------------

During the scp process, the usb host won't put usb device to suspend state.
In current design, then the ether driver doesn't know the system has
suspended after echo mem. The root cause is that ether driver is still tring
to queue usb request after usb controller has suspended where usb clock is off,
then the system hang.

With the above changes, I think the ether driver will fail to eth_start_xmit() 
at an ealier stage, so the issue can't be triggered.

I think the ether driver needs call gether_suspend() accordingly, to do this,
the controller driver need explicitly call suspend() function when it's going
to be suspended. Could you check whether below patch fix the issue?

 ---8<--------------------

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8a9b31fd5c89..27a7674ed62c 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2367,6 +2367,8 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
 #ifdef CONFIG_PM_SLEEP
 static void udc_suspend(struct ci_hdrc *ci)
 {
+       ci->driver->suspend(&ci->gadget);
+
        /*
         * Set OP_ENDPTLISTADDR to be non-zero for
         * checking if controller resume from power lost
@@ -2389,6 +2391,8 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
        /* Restore value 0 if it was set for power lost check */
        if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0xFFFFFFFF)
                hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
+
+       ci->driver->resume(&ci->gadget);
 }
 #endif

 ---->8------------------

Thanks,
Xu Yang

> 
> But it's unclear to me why the hangup happens and how the change above
> fix the problem.  Do you guys have any insight here?o
> 
> Shawn
> 
> [1] https://github.com/reMarkable/linux-imx/commit/0791d25578cb0e46fd93ae7a3c36ff7a424f3547
> 
