Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC77156CA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893373; cv=fail; b=cx9TflMUVRAEZc296TwCPZVGhdF/UdNS+z89MkgK+Dy59KBjltWp1433wUgP3KAc/sp6qzGjftCDHk4dpszYdHO2VXCGkUn92L0nSBqjzUlELqHYoAH3ITp1tba0T0QBylIqDzCzFv9uxiy3QJvlwT/KxKSksGH1ofia8mHvGGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893373; c=relaxed/simple;
	bh=FhU8kCijoSKnJrEwvLhu+sVHJdMXghQvWc8emdQYjjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q8SqnFqy3fzi5bpQxNd0e8D/25q4o6Pj79+pjQGdNLZlPPgcHh6dPNFED5tNDFjzD6fFwZL6iss/9fMmakSYv/3KJf0Uhd+QJFGUxV7bCWhOjAtyHR1qWGFreoQvttjdCIBn5irQ3WikXRHjrpRMmLTEFcBeMLAHKXHESeUyA+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VzbwAPDi; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VzbwAPDi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHSQysnUKvBtmoQlH+FTSFMwO45RGDB/oG2E4Xv2rcjFWdrlD0T69IWJfC9yfQB6wD1cuvLiAZM584BrUyr4Z9dxb5+NECxhj9BAIFIo1cm70GoN36P3NVfJbklQMejWbQsE57I0ZixnNzDyqJk3fd2XU7vMKVZSXKErJNy8j6xp+1Oe9QUfq7FoMjih6qPRZBpoaJf2Gnjbk+fddyY+VUWeJQSTXVEXakxh6+YF4Jfut1455Nzxr73nwoM8thUXmAvyG0x/L5xus2OhVAwv99PxyMlReNTzm4OX17M0WnYmTQHoxQqFuNfpzdVEYFzhR9gco2U0/5haCLrs9sNb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BJvBiWy6s70ETdTH2uAR6MXAxs170STf7eHCEUXe88=;
 b=nTrMNKFdELb4W3RcbyQvyjI/bJKL0g5aICkPtC3+Fm5V+udwKvO3pTzQgw+A4ut8KfEF6Foz2EkMX7J6bWPlXwnBKNrgGfPOJ0Rl2MnoA0WcEItp0tbyZ7VwBJ9csUU8wMzntbRmaWx22bec4OYBKI0NX76EVXmqanABRNBc16qCwDGzge/Zb73cmpDLqtK2LehlapEyG/3T9epY5NIg6m8fFwOWPvrBcbbftT7C8YM4vUVz/pc3s5kooR7aIs7XnIEEYjodqZEbqpoNPv+BmCKeiwmjhf6CZ6PQkOd9rG+DkES+9WEjRXPaiK5lnQTQmd1DHLGviTe1CBt8GzVULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BJvBiWy6s70ETdTH2uAR6MXAxs170STf7eHCEUXe88=;
 b=VzbwAPDiR87+jwYwBPMFPwvRYCT7dukKBEaGFOtzWPReqIt+YCVGXbrpI96Xlu+n0atvqNqKdDo6pFN4l4RFBuQ1mjtbANnLWRee1DD31kg8ys3pg75yPE1yuyqlImm/XPprsR8O6VeoOxBM0Qnx2JAi20WnNXvLiQK4vMOW0JVAAbpcsYFlkLbTs4OGRr75ufSKPUJVvbWA7PpRm1GR8zTJwyNwy3f6g788xtTpgCXOQytFUMEuz2V5V29+MGVR5Jeo4YtPz638wdQ+gqpvOSvJOcidUDT1Uy9IsOP7CGGKBu4oqYzOZp1A2+nY8Mp58QmhPzB5AH6LCAMqrbdorA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB9031.namprd12.prod.outlook.com (2603:10b6:208:3f9::19)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:36:08 +0000
Received: from IA1PR12MB9031.namprd12.prod.outlook.com
 ([fe80::1fb7:5076:77b5:559c]) by IA1PR12MB9031.namprd12.prod.outlook.com
 ([fe80::1fb7:5076:77b5:559c%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 12:36:07 +0000
Date: Thu, 17 Apr 2025 12:35:49 +0000
From: Dragos Tatulea <dtatulea@nvidia.com>
To: Eugenio Perez Martin <eperezma@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoqueli@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>, 
	Xie Yongji <xieyongji@bytedance.com>
Subject: Re: Merging CVQ handling for vdpa drivers
Message-ID: <shmvjznci4e7m3oeqzqrhmvsljzatafwpnauyyrlpv4xcntljo@w4ip2b3m34w4>
References: <CAJaqyWfcY0Hi=B9rPAqAfkJoXBgf0jYm_dUXrRX=sZ4XRCxjOw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWfcY0Hi=B9rPAqAfkJoXBgf0jYm_dUXrRX=sZ4XRCxjOw@mail.gmail.com>
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To IA1PR12MB9031.namprd12.prod.outlook.com
 (2603:10b6:208:3f9::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB9031:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: f45a6338-708c-4b80-1483-08dd7dac6d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oB4QAW5ngeY2vvde42roA55lHkz7UwvdW7W3UhERYB8EtE3ZWg8YErq3Q48V?=
 =?us-ascii?Q?wwaM386Wyc7814j8HIKIQ1ExGNGNpA7z2C08l4t7kbShIsip/HWgXquG0SO9?=
 =?us-ascii?Q?Zu3wurE33E2wlpbQDlaU/oJTDK8CFAp/wRmNdh1gR1oHFZuhqHMSXsQ+M1lq?=
 =?us-ascii?Q?pDEzAC66wjBEHSABodeFY+PArGxyZo8K6M6AuJZ22CxzsSslSFboOTeWIrGw?=
 =?us-ascii?Q?XUM+Ece+p1ShYc1RHerHtt9cKL5x2OrRh0gGHE9uZog6eG0S451PYFVYZuTY?=
 =?us-ascii?Q?sm8jqPPVy22xvbNK7wI0SvD0RnYXxAKHV911Hy8YIIk//DnA2Gh5iSroGwZ4?=
 =?us-ascii?Q?Pk4/BnRP9mRhPcgEfCXv0wSU6vM+2HI0MHfFhpjRD/tT9+uSYgBhpjjcNEQS?=
 =?us-ascii?Q?EVbzay7B3e+1Q1SejDM4NV/O6975f1kPLRryIc/KDbFwptr+I+eUkJGP1uf4?=
 =?us-ascii?Q?b7hWriS5fB/Ah/s668pjWsKj0EK+6jgifsXvRsFts/eEeBAvcB2m8+tFX6ny?=
 =?us-ascii?Q?4c30n4RUxO8o1JwgkfyeKvEYRFUTCiDZyPlqocPN3TnT9YEbPuM6kBvjDHPi?=
 =?us-ascii?Q?yhUu7c9qmsD3wlLnLqe/4Rjd32EdEla0XKVzz5ItX9TiSA+NMkP1Bh503/ag?=
 =?us-ascii?Q?cYy5a1HRAi8i4v8GeFe3wahJNZcmFWaW4HL0i0OFcziR+/YIyFQgbpBbYTQ4?=
 =?us-ascii?Q?yEw3VabhNApkdWTWvJiqZcdxq99ZuQ9o+YLSSu3dCD9yQ/4ZSI/pNrTsYMY0?=
 =?us-ascii?Q?QRQLX6jjPhRisQaQSL9MxpQ4VuyYSwmmLiWots2O6ssB6gNNukCXwcT6IkF0?=
 =?us-ascii?Q?JuJ5IZfSRSI6XyuweWR39uwd1XH8eUkE4vqhrhd1cUfQ70TEdW2Si4UfqwKk?=
 =?us-ascii?Q?TZjF7a2pjmdkx95rqir5B7PQWtSQ4SOHzmsYvpe9xtZvS8ak7Q7M7qq6cdSb?=
 =?us-ascii?Q?WOMVkG/PJlGvLb2auijQPpMXSJvkusH6FE8w7nQazzcSU5czIyVJK2lx7VZ2?=
 =?us-ascii?Q?Js42zGUMxAQAcSAg9Kx2gxk4jjmwMqHDAejwgvV6tXWhQnJuPM9qSk1CKB73?=
 =?us-ascii?Q?BWYuEEBLiggT/dgaWX+bYqYwYdghe0RaSjYP+gM1aA7YBTeYgGBwig+UMySJ?=
 =?us-ascii?Q?cyNLyynBVKUKlCIj3FCTK6zm6Eudb4PJwSgphaE0dzmnCCQsNMK4PSIoFsom?=
 =?us-ascii?Q?kOjneoqlEnfR2NqTelk36H7Cq6bOoBlPYwTUM5tCcIqaf3wHF5ZhmBm92shO?=
 =?us-ascii?Q?c9506Yk+eWGLUuBCUkChoDwKuH8tzloYHmqJzqMmWDy0nGdgZgIdpyE3K3ig?=
 =?us-ascii?Q?oFHN5nAmqtnYbbJe1N2ZVq0461EqomR0q8stvKbGWMnAaHxbYDaVoOB0O+Xw?=
 =?us-ascii?Q?o1LMtTF+DHdxM8fj5ntdppVvr0rQkyimp/5RjAKSO+Oh3OfnTtZlRNhJ/3Ft?=
 =?us-ascii?Q?zwoIxxPmj2M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB9031.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h9xbg91LgT+0aqZ4W973MrsEr3+X+L3x7CRKBXxviHDejbFCad7b9ET+/NhH?=
 =?us-ascii?Q?d0HG2f4fmatwYNWSCVpebnoMA0P74+mOK14jrbQYZCLn3/71wIHqXUNlrT07?=
 =?us-ascii?Q?49q7AqHQzHE88htGCi4Jx9IA6a5edQblZNa0oIXrBPrCPDVZFlM9B7QRM0DZ?=
 =?us-ascii?Q?Dw/lpFXwgt6S9romAKoei40kmuwDBb4X/HNHxjmHS5X8/Iicv3g56zaYpOdO?=
 =?us-ascii?Q?MFNcrsIY0kWlhPav1PSDZhlfGsy6wkurpafw6bWQyhowOCXP0PAqGuR60hw6?=
 =?us-ascii?Q?YNJjR4YlhWsf+scpa7LPjsEm3KHv8Eos+Jepp3ot7KCA6QEkg5mtXr0pjilU?=
 =?us-ascii?Q?DGHM1v9o7G+KXyrtlYtsiFgXWRcARuFZPM743zYYFVeGW2C59IUNoBXdBw7H?=
 =?us-ascii?Q?JXGvRNPxLkBsRDPTZUIj2HD3imaBVtOklrbcJUJIMDVpyLcTOMQ2b/bm2/xX?=
 =?us-ascii?Q?pgab93ELgLuxCZwVZtadv+kB4MOggm54w/ZoXs5d2l5dyAhSyMZkqusU7HWb?=
 =?us-ascii?Q?0UbO+1W0dSoX9ipRoq4msD/bm1X0R0qTdjLPWM9xAtvBivsH/V+8atSkOs8F?=
 =?us-ascii?Q?eqL07j8e3jZZjfGtiM2eyG4mVtrHy55U3ufJo6Hf+jWyy0usTzT5LSUHqLjn?=
 =?us-ascii?Q?I5eQVkpo4C8OEij7O930rpx7W0Rn6DwyfCj+Iz1Rn1SxuoIgKVPuTxsfHUcH?=
 =?us-ascii?Q?rR6/8sA+F1U/z9gb8F0S7I1tykUz1xJLoTfLS0kUZ9Heqzu/0H3o92TaPnis?=
 =?us-ascii?Q?rqS0vlc8qmls20lW+U+xp+rYfiZo4yl3kiUhYA34U5j7nNZJJZPKIYVobcNI?=
 =?us-ascii?Q?lBvOtF/lWhaW0EwDPBwIG7/ti4MQiOjT6zvcVUtQg6+tS8PQb3tYqQG4sXkX?=
 =?us-ascii?Q?zVvzqA9mEaks8IcFPcBnVvf0gNX0zfXA8YFZz62saZhJIBhmH7Bv1QSNiAdn?=
 =?us-ascii?Q?ZNuj9ZK2sCHhnZh7BA7LNlbDypVPqE0SzaE+JdonhExDg1qWvv3lyorrg/yd?=
 =?us-ascii?Q?gBb3XjHmAKF5QE9lhYC4lnueM4hePglf+Fyy5QN+Y4qWqpWHK1fdFFq5d4ok?=
 =?us-ascii?Q?RJpamCz3uMydAds8ngOkO713gzDqNwfZP4PEL0OlUCxCE7RN8RFfVNBllQ4X?=
 =?us-ascii?Q?pUDcA8z8a0emQcwVQ665HbSgNlm7fgCrfCga2Q4XpDUEfZEitBo2sP0kdpp4?=
 =?us-ascii?Q?fXju2AtUd1YzRRWBZFeoCk9zVyQz/7HLSRAG/gGPhcG3+BPeYyZ5rfHZgOf2?=
 =?us-ascii?Q?U06/rkyUYiJIf8ePfjENiiPs8e2VQBwLd52ZexGnXdCiI/6XyFGSMxI9nBw+?=
 =?us-ascii?Q?7EeppKIQacb/4Ks7CiEgyHlkMNaKSOMLMMjFoOkRJB1uXWJFaQI9GsTGFOqg?=
 =?us-ascii?Q?4U6U5L163nHjA5Ms6VG7ixBHmZrmr2/AH7JKsyFjR6oMqVg6zQTSfxHPN9/1?=
 =?us-ascii?Q?GaChML6Kq3TNMKMr7TwiFMF3NanmT1ZYu90L+adJ96a4ZCk9WE1EBk+BaWWE?=
 =?us-ascii?Q?YfNZhyXwz890zHhbMKqusR3tP3MEJLIQRkCWkAUt7NYOwrOZPDldiaH+p2wf?=
 =?us-ascii?Q?ItJdM+o13AEIXzLgqfW3qYiY0VDdNaRb2WdrNRdK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45a6338-708c-4b80-1483-08dd7dac6d0e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB9031.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:36:07.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YsSRwx2ZS3HT4tOZfGvg9h+vkIqdWvMmncBtukw4YdCxgKqOacyvP3OGSsv5UcthBKgeem4vxg+xZl7jREtxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

Hi Eugenio,

On Wed, Apr 16, 2025 at 12:58:01PM +0200, Eugenio Perez Martin wrote:
> Hi!
> 
> At this moment mlx driver and vdpa_net_sim share some code that
> handles the CVQ and are not very backend specific. In particular, they
> share the vringh usage and the ASID code.
> 
> Now VDUSE could benefit from implementing part of the CVQ in the
> kernel too. The most obvious example is to avoid the userspace device
> being able to block the virtio-net driver by not responding to CVQ
> commands, but all DRY principles apply here too.
> 
> I propose to abstract it in two steps:
> 
> 1) Introduce vringh-based CVQ core
> 
> Let's call it "struct vringh_cvq". It manages CVQ, and sends to the
> vdpa backend driver just the CVQ commands. No more buffers,
> notifications, etc handling for the driver.
>
> The backend driver can interact with this in many ways, like a
> function to poll commands.
I would like to quickly explore this direction as well: how would
polling work actually here? The entrypoint would still need to be the
.kick_vq op, right?

> But I think the best way is for the driver
> to specify a struct of callbacks per command. This way vringh has its
> own thread able to run these callbacks, so the backend driver does not
> need to handle this thread too. If the driver does not specify a
> particular callback, vringh_cvq returns error to the driver.
> 
So does this mean that the driver doesn't need to create its own work
queue anymore? It would only need to implement the handlers? This sounds
good.

How would the .kick_vq happen for the cvq? Would the backend call the
into this new CVQ mechanism which would read the commands and dispatch
them to the callbacks? Or is this also abstracted away from the backend?

> Just implementing this first step already has all the intended benefits.
> 
Could you explain a bit more how ASID handling would happen? It is easy
to imagine how the CVQ commands would be handled in the callback based
API.

> 2) Driver-specific CVQ callbacks
> 
> Move the vringh_cvq struct to the vdpa core (or to a new vdpa net
> core?), and let the backend driver just register the callback ops.
> 
> This has less benefits compared with the first step, and it has more
> effort comparatively. But it helps to move shared logic out of the
> backend driver making it simpler.
> 
> Is this plan interesting to you? Does anybody have the time to work on
> this? Comments are welcome :).
> 
Interesting: yes. I could help with the callback implementation for mlx5.

Thanks,
Dragos
