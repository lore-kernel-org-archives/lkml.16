Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F711C5F14;
	Mon,  7 Jul 2025 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884909; cv=fail; b=dkQwvji5DKY8QeE62poRMqjHL4HKVYx640TcpevapBxYf3X4DNHp6l9qqUMphH+7ZkrU4ql4wTTP4MWBoHUSJzeG+MLbW/wIhnliVN41OS/3QnKYPgpQdgFC8ipbTKesTarBbjIDFHvn8xKGl+V6NIdm6sN+cGE+khnskws92kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884909; c=relaxed/simple;
	bh=SAkPSQTSYs8itxfs/baY+ALn0te+XbGVVwHSjx9VI0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BO3/K0hFaJNsxFsTeT5lkQlovIFbIFteCJkb1WvjNsFETPrKMMt0HJaEeZJSVEHOjxR7ELLgDoK874AK8JuNOKzc6Ik1kFyf3wZH5oAU3tAK0hG10JyCObtuxMm+WJjW7blEAg9U5ZHLU18x/7VqhAIdYArj1Ob3j5gRxU2+QPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M6reaxbH; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M6reaxbH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coCulx2KgCAfUi9BlJK2WBVwtKQd8JgUO8A2D4VG16MydaX1wnaIV/qhH0ABtJ6LYhJy4IR8GEd7G88XeoDLQJUOB0bjsHfJdKyhfGR5HS5zLEdj2DJxR1vHK2qI9QT+8Ji0SQfoB3+xeRmDPP4DmpSbzdVpG8BlpktyfLsBcKmd1mEQrT42rlJqeDS7Ctb2ukv3LaqC7RQJ2Qsy/9ThdFfBHU7hvZ6roj5y2SL8j2eOXynh26R2nGwCiy5GEqXm6Pd5nlY0nU0/6YsBYCTt682IEdpO0ZVlUWdQhc7Jd52+6rUSoDm9eab8P06ZGzwGCnJ79ztbGODaxtZzJHtl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAkPSQTSYs8itxfs/baY+ALn0te+XbGVVwHSjx9VI0c=;
 b=Ms9UCn9ZTuq4noxiw4glk6q/E6Y/R6HhNzzKjdfllMpBJngy7oVEoneeu6t81oxAJ3RbRa7YnS8ITNtvofsSoOTK2rWPqjt6Cy1T5uqrXEGD/wjKX7z/+5ldEyfU8FV+aaq/nzTgNiSbKWM308jpHcYYFArqnZFAhO23iPefU2id2PmJJzgo4vsPgw3P8NuIwtT6KCMk/yiyYkM9ACPzMvgK3gObxAv26kHPpspjWJRusoMPdA4AWJSmlpEyw4PYhruYlqkNArdySoCcyUuJfuaVkfesQ7sARloZm6fVjvuCs3Pyd0ZxG3Hizn0i7jJ26VotPiNRUimY7gcY82WKag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAkPSQTSYs8itxfs/baY+ALn0te+XbGVVwHSjx9VI0c=;
 b=M6reaxbHKCxFVcdZupDELSB0zFtRBHU9qmmaf21zZXmGqLZxraogrEWfP9HgbWuoivEJhnaypAZeZT6kvqFJBPtCZNjlVQKGQwC3OMf8gtuhUTYCaodPMQjit7WVMyqkTw5pJRpLlUoz30gAaiBh8Gv5umx6sqcg6/g/ZXQAck4=
Received: from CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 10:41:44 +0000
Received: from CH3PR12MB8726.namprd12.prod.outlook.com
 ([fe80::9532:640e:4b24:7dbe]) by CH3PR12MB8726.namprd12.prod.outlook.com
 ([fe80::9532:640e:4b24:7dbe%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:41:43 +0000
From: "Chary Chennoju, Srikanth" <srikanth.chary-chennoju@amd.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Chris.Wulff@biamp.com" <Chris.Wulff@biamp.com>, "tiwai@suse.de"
	<tiwai@suse.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kalluri,
 Punnaiah Choudary" <punnaiah.choudary.kalluri@amd.com>
Subject: RE: [PATCH 1/3] usb:gadget:zero: support for super speed plus
Thread-Topic: [PATCH 1/3] usb:gadget:zero: support for super speed plus
Thread-Index: AQHb7NiAwNWfLFJOhkyHnTxCcA43jbQh3fAAgASe++A=
Date: Mon, 7 Jul 2025 10:41:43 +0000
Message-ID:
 <CH3PR12MB8726ABAFBCBD1DD1DA3B1000B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-2-srikanth.chary-chennoju@amd.com>
 <2025070407-walmart-mobile-c0f7@gregkh>
In-Reply-To: <2025070407-walmart-mobile-c0f7@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-07T10:38:41.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB8726:EE_|MW4PR12MB5628:EE_
x-ms-office365-filtering-correlation-id: ed31afd0-17e4-4af6-e555-08ddbd42dd5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AuMdNMiovu/t/I0lIOhLoYwaECRy0crlEuotDIXgDXu1Ep6714PAE9t3YMVA?=
 =?us-ascii?Q?yvoapv4b0h9R94jghzkiHE67B3FaD+UlufNmGrA5ZhumZFNGpExkWeEfogOI?=
 =?us-ascii?Q?ee+JSVEkp5SV7ZqNZrp0QM5f5y21X9JSifSvoAGfs1NofD1UtQYl/2mB/BCY?=
 =?us-ascii?Q?8ubSsHhraJ3RfNihBzfj+gUEgUHrzHTCABm/JFoVYobdaWa+fcSwdPneQqRQ?=
 =?us-ascii?Q?vLg+wjjTtruBLOjB/u3mMQaI+qOGUZSLWd4lf20X62yh2WhcnezGnW0rnI8H?=
 =?us-ascii?Q?Lwr7ax/7yH1lm+9ryT1YAtjqxDJDEXPrPkcwUERirWFXYDZ+kLZ8tuEgSFx+?=
 =?us-ascii?Q?sR2PIxVPxU+ty5T8RNh7XO5uXYMv/UgHRCjSEdiBqPGQ7r97333lSNWrFTEU?=
 =?us-ascii?Q?D8ijmXEfDJnSOtTqrOwXK2HMoZYgIEmTf3Tv6/OVOCNAmeNyJfl35tNuY8Sg?=
 =?us-ascii?Q?cvBvBKiE5hckee9PxzwWJ42Bg4I/1R3JkaA+IPPNzn0q2cGI2tqDfJvIKYN1?=
 =?us-ascii?Q?6AkBPEwwwC4CwU+Lg91JPGj1gF19TjPyWtRiVtaG9sMhNA4G/7FQVlFnGHm7?=
 =?us-ascii?Q?+3LRYA7ztHPLEyWKKeO6untvkAIZtE8w/567OLDqy2c899oaPFgITjPW9M0/?=
 =?us-ascii?Q?vEJzVZ0npuxZ4vzrMQUOdKrPugsyXdq//1rYoNsgFWO16YFt7KXY16t2c5jS?=
 =?us-ascii?Q?3I9H28kto/0EeK2n38+7vE0Krhqn3h90qOUnSjCsTjNo+q2d9/pdZno1aikA?=
 =?us-ascii?Q?SJ151zv38mPAOWnF6hQe41pfabx7VAwb3L/nfaxxxDWmzD8AxOvyh/WKjQ3I?=
 =?us-ascii?Q?Q24911p7sD7IdvBjBqOBxh605wWpeqMiFu6RQ2RrNkx1zOIpEqCI90J6BG+h?=
 =?us-ascii?Q?vBwA2iMwK9dSGzo2aTR/bcLbCretayMoECop1R6VTjMwgsczF7lngD+qqtYE?=
 =?us-ascii?Q?jkfqYV4f+FGjXssfMmWtDfw98PQbrWfL3FPKvGNRfceQDn002lb3AnRNAq9v?=
 =?us-ascii?Q?CbzzAtP02I/lkfq75GEzIIKPGlrTsygT4SSnIMwqpOS7rwlJSDXUonznaNjq?=
 =?us-ascii?Q?NGcLfnBir7ZAwY1xeI2hFzxwp4wnbUt+SCM9MnKtR7orogIgXWr/C6AXvS40?=
 =?us-ascii?Q?Kqu7J8MhGH03sW8+pXtQSQxKN9b7EBQcZKZ+5bPDIIn+Vd7CJ0eRsNvcArjN?=
 =?us-ascii?Q?5MfokSZWPz1euzBKlkqoZDlqlRe/1wQxujVxxhmjK8gO3iMNGG1vU7tgyMYv?=
 =?us-ascii?Q?i93a4U/eGgVu8DNUc2TUhhEBUL0rWtWe3Iwl3oxlbYOMUSRlLYUEAZu9NVr1?=
 =?us-ascii?Q?t0Z0ImDb3DWpt0uYyycu0kEMwd7+5QgRhR8rAf+dUhTu4qAn4OSjjjzzyrH1?=
 =?us-ascii?Q?TopEm/uTWDVbMmzPffwnVUn61yxCJQODKdH2FstGw8R+KI3GJuFk91MrTVxd?=
 =?us-ascii?Q?jQbQYhl21+Pl4cX3RE3d6pZu3svJ5xtj06OhcaUe6UcTTBmrqp3anw+SMuQd?=
 =?us-ascii?Q?mPnaY17YSJXu3aQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vmT16zPv6tOTCDRwQEpSwpAB9TxDi2jku7mz4Dyp+HyGyWNJ5QJ1gKO65uA0?=
 =?us-ascii?Q?XfdH+Y/izWWN/q6n6qW/crK3k3+TMSaKTpdDWqZTaIbvcql9VO++4iodHnLF?=
 =?us-ascii?Q?uftSh+k/utBi230RmXizKcjwEI+sWl90e7mxQkV2QGpOwMF8liIrM9jB4Gz7?=
 =?us-ascii?Q?b1o7oAYW0qHk+lxb4pWlJODmfI4C86S1OxmLrbmf6rmICNEloJS1CuXNkdje?=
 =?us-ascii?Q?YOxIYBifMQMP2AAZwlqre1yburatswK1tYw4RnVwW39yXZUnxH2BAiaZ2iTw?=
 =?us-ascii?Q?PGa755gFjo1m2VDzR2dPGY+dq3bGSOM6YsiiUCHdlzU6M3WY4SlyUYJR0Mhj?=
 =?us-ascii?Q?lbK3PPviPIPaPtIlmG/lupyTT7tgds+foAriNXLi9F8pIbO608CuB7NsjAeo?=
 =?us-ascii?Q?rffg1H/oHzx4JxC4xYE8a/LuuYcsOiK/kMdTdIYBXZh4cAG8WydNwc+dNX22?=
 =?us-ascii?Q?JQAyG2WjIhsrBRFqG6TrWJpb3qw2MHTadFanjemiegwgCBBQd3D3IKHOM85i?=
 =?us-ascii?Q?G50hxz/sgrCRxI47KCMWNlysVWNf6eXWStPFDxMPwbfwsi6ZRzFgf4In6a9M?=
 =?us-ascii?Q?bWNLfUPKHATNlamAiWlsVBik62WCHZNpKVFgW/8azqy5Kt4aDdFogAQ2EloE?=
 =?us-ascii?Q?ALq6WJsbRCDO51/Haf5kjX94rFsGrs6KNE/WDIC+gKooIQS2cSxqitbJ69s6?=
 =?us-ascii?Q?yP6S4USi1t5tiOzSnuAd4SMDdlyjnJSZWkS9pEla+kseSjaYS8XG8IcO0wa6?=
 =?us-ascii?Q?CVo2LRrg2Bt9QM7TCfO1lViwujA/6mdHXWo2JS5Pkv4ai3S39xKJ4ML0LdcQ?=
 =?us-ascii?Q?3qwljzTMyOTb84fmq2910oBPUH2eixKHH7amGcMM7dcLM2pWy8lYi8MVziXD?=
 =?us-ascii?Q?bns1w4g9sXXL9PmtdNUc5px5gcGuTyGLxHjHlg3Pwc9XthiCHuG5a5xrSV8G?=
 =?us-ascii?Q?4SmKoi2w+zIDlRT9OVsiGfkH0MUooAv/X77CPZ5MmaNIPe2xENnRl+MjbQD0?=
 =?us-ascii?Q?pQWNTKWxHn2C45cv5UbG2Fy5jTDljPCvdl6RGaZ7l8mBlE4zdaQ2cW1sxDS0?=
 =?us-ascii?Q?SkVi0whlLt6ATh8bk1zs3v8M5oFfnIinlcb40cIBeMqRcqkpi/Wjcz5COjZr?=
 =?us-ascii?Q?7mMpfujZnKRBAcmCRmYpnKiOb4q25rYBAje6wkI+C7ACUuL9ITaqujUIY+YR?=
 =?us-ascii?Q?zdptubVyzjlrU2Cq1lSX8zRBPIvMxk+jYdyAhYn5xLLw/ka4eVqZ40xrbs9a?=
 =?us-ascii?Q?v5JyFchV8KgHIRCSBp+9EEyvXj20zw0Q5X91CIr2tSAIzd2BnJUG+cEhMIy5?=
 =?us-ascii?Q?YjaG1d3mVLWOIOwp2sL1mzVazy5kw2ezP5mykBfPwrpxu/8WQqh+EqD7vGUI?=
 =?us-ascii?Q?gbgyy+V1viRWwRpGgBOpkVlO57sQX9i8mXgm05TIXPBpBU3ZzRsedXY+bpLa?=
 =?us-ascii?Q?TP6Hxe1U6YJaGaRudwl0QNtV3ct4MoGPcULPdwV/UoSevBRCkbEU5F+KB/CG?=
 =?us-ascii?Q?sx1kt1sWh2SqrVmE1IholMDRe5rDVFoCXkhWqv4nmk3zev+1IgEzLxfuSwBo?=
 =?us-ascii?Q?XYoozHtbWH+0aeCU3Io=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed31afd0-17e4-4af6-e555-08ddbd42dd5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 10:41:43.5369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTzyek2rzL3DJuLQ82qzoFe3fH1IaXZSyUDHtqNHkw/T6Fabx+SZKXlglIXm8wlW+7saBFV5wIIInhB/8htfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Greg,

Thanks for your comments. Will make sure to differentiate the subject and c=
ommit description.

Please let me know if there are any further comments for this patch.

Thanks & Regards,
Srikanth

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, July 4, 2025 5:35 PM
> To: Chary Chennoju, Srikanth <srikanth.chary-chennoju@amd.com>
> Cc: Thinh.Nguyen@synopsys.com; m.grzeschik@pengutronix.de;
> Chris.Wulff@biamp.com; tiwai@suse.de; linux-usb@vger.kernel.org; linux-
> kernel@vger.kernel.org; Kalluri, Punnaiah Choudary
> <punnaiah.choudary.kalluri@amd.com>
> Subject: Re: [PATCH 1/3] usb:gadget:zero: support for super speed plus
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Fri, Jul 04, 2025 at 05:10:11PM +0530, Srikanth Chary Chennoju wrote:
> > This patch adds supports for devices which are capable of super speed p=
lus.
>
> Nit, you need so ' ' in your subject line :)
>
> thanks,
>
> greg k-h
