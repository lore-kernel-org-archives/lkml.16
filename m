Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE11D88D0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297420; cv=fail; b=JVdW1bukecQK8oY8KaAdjGQe/T7lsCGhNSkJjrDDjBSDZzNnMJO0Eeml7k4zQlSLCWA6WN9LVO0iy4zEE64yD13Yuv4DCCYdISNjRWeuYeR6BRqLa1/wf9kqIQ7WS1pTd3aYcG9vEpEPy+D2ATlEh4J1VeIEoeWukxx+ylzrprY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297420; c=relaxed/simple;
	bh=ud2S+wFF68pcawgcH2y74fXtyEJmqr/QMoisBepSz1U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cc41VZo5rYbfhCroiwb57QJ25H0rS7vRxhHSqyAQCdZOKNiRvHsjdYKgnk/+S/WpSO11vk7PrGGWrsSJlHfiUgEJwpMMGTqwVM7HFaYE1ptal5tL4KEyNXCCSVX4BJ5uhMIcyyJWz/QehNcDVC2fOLaPIzecGqJ9fbDwyOjQGis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nBG9RQHR; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nBG9RQHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPLqeBiuoKU1FEMKPT773dps48zV9t+BJcL8Z+1TN8Ti1xGVYZASX09DMlHpWs83Qr6DTyAK+ZgRn97ehV6EkCiBwYLCN0kHrgnMA0Rn2D6nwQ8zsNOCk8XBmRUS9oXqm54u9chAUXMUwAhimEu2HgVYK6g/yu5t43MKY72DU4QPWM4BXqF5/N7mQ8dNJEE0/x9EesMvxzhOsYj4QllOgdjFuz4achEaMAPdkh0huDfLcAcd/6/8R92Zve5dw7EeXqdOCUjy0ZZNviAdVB1F7mNZnOojmVwrStVGu/+CZOqCGQz5WUgbzNN4ZPz8gZSl33axx/YNPFv51Sh7TfhNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6SRT73AXM/jmW4dttotYWYBkreqdxpnGhcYebnLO7k=;
 b=ONwFyemLiaHflv1r6jMRr927/ilEP9ATxr1MWoZWhpRDVzZ6Me32//4XBRUq7zkIxCW6GQsPJC7KhzvQUd+IXN6JZL4M9F1LkcTUN/QtC6uoXeOpmjTC6iqa0bF3T8BzgDmuYH82mOa3/FtQhugJ8T7wrUioQ2n+yUWIG6b6i/G4TGYw80uc8SrpWNK1S29Z/K4WnE/mNhpsSflavCKJR95ovZlcEbXZXgqlAEeTG+2IAuyRM/6L5QZUXMwoEYoBUhrae6CzYDwHUH7FE6Y3tx0hF/CfvFT+ToY0quxNPWK8R+tX4WaRvy7zgdLeMBMZf13sAKbux/8qoSnONZvo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6SRT73AXM/jmW4dttotYWYBkreqdxpnGhcYebnLO7k=;
 b=nBG9RQHRxzVxGb/qtGYScY2wRMCespy1suqZ7qOXffDccKshAEvtujGrZllWv/jH/uLSh6/LLfXvSlXwr0txk6XXffaFuhc3wOLJxJERqNCwag5e5JRcLW0FRLB4l/cikVdJPdIliht4ONM4Tq4y2cimofUpi4UJWUIsucF4u9CdWS6TipAahMUuMioTnie9H90ZNabx3racI5lT4O2QTX1PAY0ZEaSQFUIMgfxxAIw0G9byRJe9eMTAPKfDadJBpiu8fjQsofaXQvI3+kOG9BeSIRg897gSGOnYFFCK/gWc9iuiIajO2zSJYYVDjP2pF3HZeM/Kp6v8T8CBvbfvIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 15:03:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 15:03:33 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v3 0/2] New rcutorture candidate commits for 6.16
Date: Thu, 10 Apr 2025 11:03:26 -0400
Message-ID: <20250410150329.3807285-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: fe70bfd3-4fdc-4f10-867c-08dd7840dcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3nyw8U7OZDfnKziUayNT6CStGXvROAMDDRtCz64ehraGVFXrjCwk5DXC+xz9?=
 =?us-ascii?Q?yZDHKO4zyJqum/0bK+obhS4lln12Nzl4zZd3x+Hruhf/STq46t3Wq9lGERUM?=
 =?us-ascii?Q?CM4H4cNth3U7qeZBo2z5auQvJ/E+Q+j4K/SL3erlL5L9awrhVfDk8UgcKjkO?=
 =?us-ascii?Q?SRb3NqI8GgI5S8aY3TTft4yNAZk7jLiTDp0+PO/AfbQ8GERXAeOljm9Kbypk?=
 =?us-ascii?Q?l+NtovBGNVwO+NKvbT3LCnojqEcLmqclk0ChexjJoqk7VwPjFnegJ+LLHmnH?=
 =?us-ascii?Q?+8y81Q5WkT9iOv2hcQUhWSxKCQxskTAiVSfG2FZdPh9tmzDsjgOH64Uglekv?=
 =?us-ascii?Q?cP/3QlTnCFlK2B0z8ULOp2MB3WtIY/PxAQMXSAGj3SA+Ce7UpFqOoHyNNARi?=
 =?us-ascii?Q?CMQ+Rf0anfOjQ+QhN+QeMDG8vXKQLep2ZlSYPfHvYTDZ7imiYdEDWmeKA9S+?=
 =?us-ascii?Q?sH7mE3RqLSrjt+j9Fs6EfC78G/Snj1pKya0tYEGxMP0YcaNKpgS3DKEZfQJE?=
 =?us-ascii?Q?umS89Ep45V63tFksKwvSchvHLxpeyI1C06C1zVbmxuSUs4n3pWRxmweMqDwL?=
 =?us-ascii?Q?B7/FCleXAgx1X/DsjU/KGfZdD/L4Gv97c/WlCvR8rbaI8ZdrE3algxDHS0V0?=
 =?us-ascii?Q?FbKIr+UqLEHMXDUyU7CecV9GyCqawJnqF/OLgIR2n94jhhdqAyMNc3ynlNiY?=
 =?us-ascii?Q?0H1YJTiS7PB5wZExizu5zz0FX3xvnPm9grGFS7v8sKD32u4Y2Te9wfr5BsLy?=
 =?us-ascii?Q?TTi/OwaoYuWWc+0d0xyuUZL/2xn1Hy5kZoNIuiRG/OXFnaDdanwvZzK+kwF/?=
 =?us-ascii?Q?An1LfQnL+KQKSgNNf7APG7Iocs3H9WlIoYXZd4cIMRnmL8NQB1BR7rleWL3z?=
 =?us-ascii?Q?Oi4KGV/sMFkMkgIpLm3FkXCuXutz0AHXPGkypIfd8BB8Rh3SEXyxS2gWavEX?=
 =?us-ascii?Q?zgqOA1eJ2D9SFxvgQAHnWoWeyR8XGkuFjDC7p71bWEBeT3UBVcTSnAOs5DLu?=
 =?us-ascii?Q?UEa32Zwjvgz6rT0RJikSRf4n7k0Sq/6clPvEKUUAYwJDHsXZ3ywFevIO4VM9?=
 =?us-ascii?Q?LY1Okkgw7FgqgFUDwmjM+3RvTiTbYwGZvhPk584/Ea+X6zGPx7VQpn/cI84i?=
 =?us-ascii?Q?hhG2aOGPsnNyE+zrcTP9adcILz2wW2xaQdJKWOCg3owcdod456+4v28kYuga?=
 =?us-ascii?Q?4D5t6X/S9ZzGUq9eSUQ8UDJPZw3kvF6g7PCoZCFHSV0zxIbADDY9H8mcyKth?=
 =?us-ascii?Q?fFVctZIXqSDm6Z0gel5PxC18pMYYATRVbmEsCxnbCAazllFdAxD03i/wgyN9?=
 =?us-ascii?Q?Vet0gVP+VZ7yVCd4ocIjJ/8yi2ap43SDLg7zvE6Q3k0tapo70Xmtb6rt1mba?=
 =?us-ascii?Q?wzLsqqgukZF0ofBg5hhcB/ZHE/iX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MfKNfJ2y5lt46B3XWJfv//pf7B/xB9Bvk+4wFdAZ/dwj7jeuS9+8oATqtqMe?=
 =?us-ascii?Q?IvPHI/Ei+YuO3sWJ+Pha1hMUhLwY4cxNY/nAO2b0M0Mm4Z6hEcc9R5Suz66I?=
 =?us-ascii?Q?Q3lS1evco4ekUsyXJFBuDEHJt9vx0wyIO5Z6vjOgohKASayafy/yRRzK06pA?=
 =?us-ascii?Q?STu5abfzn9SAsSVaK4CLeJ+uIuW+QCD7zKMQaf9fWTOVsl4cCZJ383yy71xZ?=
 =?us-ascii?Q?zspptXtzKoXVKifocle+JLIetZvZ19QYSE6aLdxdWxlrjJ+qaKUjcSk/0XT+?=
 =?us-ascii?Q?isHNZHF1qSnHcktHzru1IwiOLCe3KjiAoYLZDk6c4CYfFYZllOPNKfyfu5uU?=
 =?us-ascii?Q?6Ri9HBRPvRGC/nxB3o6qz7zhvlD92MpPLZmZfPzXNT9o3A6bm/2rgb78PVn1?=
 =?us-ascii?Q?rgw8bv0koVl6om8AVNMA9VmSX12WyNhMng//E0Rdl5LiXKlbKJ8YCN5qgS3h?=
 =?us-ascii?Q?pXlZ64KAicr5RpMfkTo3ZP5zgZPP7mEKkUNNpGoHwnSJnHDlYkXYf+Xw5SrV?=
 =?us-ascii?Q?pRxK74Apwypdh6NqPmxy+1Ax7NC1z/21DjL6zRDv9O6sv98uQx/8lPpnt0K1?=
 =?us-ascii?Q?VUmEf/fRg8bQZNCrMUqMc2P7TgKEpsmZcplwFelp8VR8IKeTgnpvK/UJrVAa?=
 =?us-ascii?Q?2/gpdQh5yu4iW+3ddpTNCjxTBEhc+YiKZOovlSj4bDXfvrI9QCYy/JcPN+Zr?=
 =?us-ascii?Q?oXkLICuSa8scnIQo9EkkwFUzpjfHq8kugEY5ek8638ddwhI/Cv73xud5KR8f?=
 =?us-ascii?Q?ojmWjge8ulGTxBmGPWyRgWFB5daEdM69KtWEfK6bpBl33bfWOepGYvDaZpaQ?=
 =?us-ascii?Q?iWWwlAkRR+/vJudHxc7jownz/Wc9UyzVAhfOLmRT9mJ/7GAidnCuZu6unL1p?=
 =?us-ascii?Q?nzpJ9fxUypGOJ4T43DZCDfOw2+joF2JRKc9XkO2un2CgHJktCmQU+PLLFcsR?=
 =?us-ascii?Q?0i3eEejILmuRsESqTP12yzABVo7e2vQXHNQrpAOkWkUknh46Q7C9rkL7oy/Y?=
 =?us-ascii?Q?fibW9sdCyMGGB5F3laS0zZQqiEA5G+K4961RAVkoU/a2p1UdcRcsgy08/WY9?=
 =?us-ascii?Q?UwNgQ8a8H9PRgMdsUbfICM42aOjTh2ZnfjesKkh7kvEQnGdsjuntH/KbUd+L?=
 =?us-ascii?Q?d01rZuJ7S2lHkE88Sk6SLXcp+n3VWOChrjBENzjbeZACbZTPxSBfpX6eH1LX?=
 =?us-ascii?Q?bLbfbCIwagTF5ZjYlHgfeAhmJ5iFIQ5p731p1R89mhlQm63KYJDjj2iixMQR?=
 =?us-ascii?Q?c6gZ27anIEAxS6TLwWTbHePNPeTSeoI/J5Hx5m+IlGGYWtrI0a7R8+Scwgvr?=
 =?us-ascii?Q?1vMa5qjXJcr/obI8vYS0rM4u+nEsiWawpTIsEqG0Ii4yKI8J8NmlUxLOPZm9?=
 =?us-ascii?Q?7m2v7K84CEO0VX3Gu39stU1zXZnBDMdpasTWvRFdOARW/aE2idZd6Gawuz4b?=
 =?us-ascii?Q?zVN5FtIDNECPIlKZP6AEk3QkiiA92wD8bBas+ojeYi8TTn0Ep1sag90iLZ5N?=
 =?us-ascii?Q?8Kg8lzL96zSpcxgvYJRySlkq6fIlUhsFlCWdKkvrxaiVsVRGRM1rdlUMzkzk?=
 =?us-ascii?Q?Jhn9blcO5KtyxQR5OQAwcIrH7/lSdCXwawF9cw1SFFwebzn8SNieX09JC2Sh?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe70bfd3-4fdc-4f10-867c-08dd7840dcf4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:03:33.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxWZHloyPoo4jSADCDsA07xbmArZ0D/tNE62YWVAhyHqXlnSbCjx6D5o3wOJSbbBgT29aiiGNVla4pQAhJnfLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463

The gpwrap one is is v3 where I just fixed the hrtimer_init() since v2.

The ARM64 image check is a new one, but is a small change and required for me
to do large tests with SRCU.

(These are only the new commits, the existing ones in my for-next branch for
rcutorture will be sent separately next week).

Joel Fernandes (2):
  rcutorture: Perform more frequent testing of ->gpwrap
  rcutorture: Fix issue with re-using old images on ARM64

 kernel/rcu/rcu.h                              |  4 ++
 kernel/rcu/rcutorture.c                       | 67 ++++++++++++++++++-
 kernel/rcu/tree.c                             | 34 +++++++++-
 kernel/rcu/tree.h                             |  1 +
 .../rcutorture/bin/kvm-test-1-run.sh          |  2 +-
 5 files changed, 104 insertions(+), 4 deletions(-)

-- 
2.43.0

