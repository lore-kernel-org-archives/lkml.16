Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023127.outbound.protection.outlook.com [40.107.162.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911121E082
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596880; cv=fail; b=HaR1UvScNE5MfgL6rpRs8Gx5wk5gDQ3hCNJvPK1Vf8ycPqPJzlAPS39IpCkXCJBlNW8uguzOoTNVSoElpIaRAno3UFZHtDibkC0I3TaHNYJL+cq2Wt+q+kcrYTBmXAxgNvQA3t465czAPM7jF2ZYih6aKufvajVX8DQgMbR+jJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596880; c=relaxed/simple;
	bh=LsAah8BKzQ+1S7o1qj4ELyyiBtp4McsrVfFlK05xXlA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RwVOCz/4kV9gogQB/7MuJ6vYlcJRVRYcWJWIKdWpkoz3X3Cp1DaXCB1g2UTnJxsTStOGRICg0L0ZAUCRkm6h7a6f/VNeOXu/3kFX5VQlBDnbD5aUslWIybEozXCo6C8jK7k1zhy4UK3RccFcGgrouZb5tJXOrkQBcJ0wypqihzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=Z7z2YvIL; arc=fail smtp.client-ip=40.107.162.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="Z7z2YvIL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdRQdubzX+nlIlXtmiEycBN1XhzNiXGgndpJj21OdAuQMdta3JR5WG5gY8xprdEaMWUUZ3EFtF25jtM6r+S905so/0AO3nM1rlSWda4GwRoFEgq69rlCA+7kdxki8ex38dJEePwEWR+N6dl37Ypex87hq0JVAFWhDmmOLeyVVaKU/Lb8IhFQqSNgU7WlP2+xktutQ26QJhdZvZDrOSfZinXYvT7MUkVbyQUgXFc98tjdVil1DFx/Pfuszep4I0dRr3ZdIhDZyttGKWgfB2hVfHS9sG5bRxj8xopgJf4GKVKMdjG4bM9V46crS9v/f8tptdjOFBjKpb87YBFUkiEitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSLOJVolvLtBFQwc1c8gyPNV2ZFeIAzz2PZ/fE0C8go=;
 b=koA7j7J8FBExHKaD9iRz3E7HA8H3r08MjdlltxnL8PvTWik3r38Dsksbgxp/XX10X8qmdRhajmV52LUajx1FMMBqTjWaJxcWgyMzrZJvHCNwrZhonkIXoHWlGsVTFzvJcGw9+SD3lHfGksuv4hLYFqc3xpJe1awPngt9Cav720DStWSjvJq1Gd8RmQ09etK4JfTuDGYwP6cc4S2z8WJFYi3PxAC1i2rlyxKq5NZLfzRrf2/XWYAx62lBuLHqORcHVp2ybmtguctzOZW+cM5MbI1wXyCld8jFOYXktFB3p83/WCB8DY3ZkLV/jUUynAet3or3KfZhyQrRtRFXLq4xbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSLOJVolvLtBFQwc1c8gyPNV2ZFeIAzz2PZ/fE0C8go=;
 b=Z7z2YvILqkFTF6QkCPM1u8YF1i6l1rI0uPx+w7euHBmT9xJG5+if9PcyjeODPbq0sGoET37x4mR4E41SONjOTWGrQwgsO2ucODpHcHMKxdrzWVupbMC7U6aY6tomIqDa0Oh8vtlu2skPFgYYSyVXYMrerDlF2tfud96XJCTFKnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by AS2PR03MB9122.eurprd03.prod.outlook.com (2603:10a6:20b:5f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 09:21:11 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8769.019; Fri, 30 May 2025
 09:21:10 +0000
Date: Fri, 30 May 2025 11:21:08 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250530112108.63a24cde@luca64>
In-Reply-To: <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	<20250507222549.183e0b4a@nowhere>
	<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	<20250523214603.043833e3@nowhere>
	<c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
Organization: Scuola Superiore S. Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZR2P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::15) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|AS2PR03MB9122:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cd910e-46c9-4bef-3000-08dd9f5b50f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVpid2U2R1NEOW9oeGpDbG5nWEl4ajhwOGN6ZU1rWnJTZlh4UnZ3S2dwdGww?=
 =?utf-8?B?ZTdnWDhBVHZBK2tnT2NzYUEvaXZtSFRSeU5qN3JpYzIyZEY4Vm9rMGxpMW5S?=
 =?utf-8?B?dFJxNzhoMXhJWk82YUlDY2hGODhPb2FmSUxLL3piUjUyT1lod1RzaHJUdXoy?=
 =?utf-8?B?WVZrbE9RMk83UytUWXIvcXYwSDdWREhaZzVVeTVFRzdhSjVJZ1RSRTBZYjJt?=
 =?utf-8?B?eHp4UWlPNkxPNTE2WTFrZnVTTlJvbHNpYlNOSDdZR3pRdy9aMEZRRGRMZ1pN?=
 =?utf-8?B?M1dhR2x1MC9oeFByWlJqbFlOM1JpdFZUczV2OWpOTndvbUIyZlBJd1dCVWl2?=
 =?utf-8?B?aHVrZzNsSUdWWXpLeWlBVFlkVmk0VDgwa3NRUm9YcjZiUThMR2s1NnVNVFlr?=
 =?utf-8?B?SmFCNTgyN1d0Ukx0RmcwK3VzMjJpNS8wdTBWUlNLSWo1blNMQTZqUloxSHkx?=
 =?utf-8?B?UEs5YllxMDhsUG9XbDVFcEx6dkN2dGx0YjVablJnWGxYY0d1V2VqblBPK1Zk?=
 =?utf-8?B?eVVCZWZLbFZFZk9wcjV6bllWbmVjOVp0ZmpHTFdxY3Zod0NyV0RvM09ocFMx?=
 =?utf-8?B?NTJ4ajcxY0hXN2cxT3A0bHJRTjE3aDE5U2Z2Tk5EdEVJa1lDNm1aMmdIYWx2?=
 =?utf-8?B?b3p4NHJVd21BUHFicEx4R2F2ZllqbEh1Um83T3N2ZVZtT1RWN3BpMDJNTnYr?=
 =?utf-8?B?TXA5SzZ5M0Q0U21iR0NEUGNTR0hvQVNMTXJ4Qk9OOWxpU004Uk01anhueDhF?=
 =?utf-8?B?Vm9oR0dUTkdVdmZzaE9YWDlURWZsL3pidDM1enJwRlNVRW5XUThLL0dha05v?=
 =?utf-8?B?eGh4TGNraWlsQUpEeUxmek9ZMzVNMTQyR1E5TGFrUEpFZ0FZSUUvR3o4Zjgx?=
 =?utf-8?B?aGRiT0lKMFRzL3lzR2U1eGEzbjhmUCs0U0VkNDFTOUNabEtnWUNDemM5VkF3?=
 =?utf-8?B?ekg1d1p3TFZWSXc4TzNySlZzdnQ4eGlJNGxtMUVPbEpaeGIyWFpmZkNaMjFD?=
 =?utf-8?B?ckFNVXRldWNOTWNPbG1JUGRKdVdybFFHKzdoYmM4Tmh1NFRlODJranpSVGF3?=
 =?utf-8?B?aUN2WmFUTnhLZURWamh3ajNXYVpTTm84R3V4VktoQnBNM1RKeTFYc0pwdXdV?=
 =?utf-8?B?Qm9NeG1UUG5zZ1RIbEJvQTMreDhhZHV0emJ5K2NUaFJMOXA0Y211NUlVYlQ3?=
 =?utf-8?B?REdPVFVuYjA0NURMWENwK1NNWUtIOFZ3NVErZHNNTlJwVnRnS01BZmFRdzlE?=
 =?utf-8?B?Vjg0S2syVzdtVXBYelFvZGFJODhERHAzV2tqQlIwWkZ0eG5mcDJkMDFyRGhS?=
 =?utf-8?B?Tm1wOHFBcHhvZ0p0Rk5FeU5uR0V4UU5UU3podUNnbEdxWFQvU1A3YzZnV2Rp?=
 =?utf-8?B?ZzdzMHZEMzhKdFMzdjdpNnFHMmVDTTIxcG04ZXF0aWtBNFoxM0Zkb0RpVnJ4?=
 =?utf-8?B?dGJmS1JPRUdnWEpJVVdTbVNEL09lVDZCdGJjVGNyRWQzc1FocWp1UWprK3pE?=
 =?utf-8?B?RVRKbmNDWXg0emx4TFAwY2xIVEpZWm1EbUt6by85VlhpTldtTGl1Q1JkWkFZ?=
 =?utf-8?B?azlEU1FwcjVlVHFCbnZGVWI3WDBzckJTVU9TQi9mQmtjU0lYRU11UC9UazhW?=
 =?utf-8?B?Sy9CcmNMK28yRUFrVjRYS1ozeSt5T2JsT2x3ZDNEVG1vSXpQdldEemdLdGFF?=
 =?utf-8?B?LzlIdXo3VnBOZWIrYlVHdERmbzVWK25jaWx5a29ib2JmalFWa2hub3FJRFpy?=
 =?utf-8?B?STNLMThvdlBTNzJhUncwSm0xaTV0MjFOTDhlVzJkUStFbnZDZTUrMThtcWlR?=
 =?utf-8?B?VExDZVBqVXhpUjZ5OXlscFYyWmcvcUNtN2JhQ3VnMmdsam1WSHVzSlRKbXF6?=
 =?utf-8?B?Z3BqZ3NuNTdXeWRMeEErRUQvNXJTcnUvdis1UkpzbE91bnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJ4VHlmVk1vWmFEeVd4VnZjT2drQXJtSTBvVnhSMGgrRXdZWFA3ZDJKd1ox?=
 =?utf-8?B?TFZuWCtJcmZKVEF6R2Y5Rklpd1BnVmNIQk9ZZEN4VUFlU2VPRlpYVlhJTW1x?=
 =?utf-8?B?dHNacGk4WFg0aTd0b3dWN0d5R3J3QWh3K1FSREVYbkFCRkdmR0luamJLa2ZD?=
 =?utf-8?B?QjBrK1NjVUhVeFFVRnorZWcxZXBnTGtCMmpmeUJtU25RUExFR2dTUWhZQk0y?=
 =?utf-8?B?Ukx4ai8vbU1JdldxbFRNc2VaQzQ5QXJTTG5Da2xhMXRNSUlKdVR1cFArcGtG?=
 =?utf-8?B?U1RVOTRvSUg1MU5uWWVibncxNU1JUkZxNzF6cm4zWFlXNWRheEdNbEJ4Tmg0?=
 =?utf-8?B?bGdpcTlIRkJ0K05JZEs5K1dWcFVnS2JjN3lPb2IrWUpwdzIyTTdNTWJDYlB3?=
 =?utf-8?B?ZjlZcHhUVDZldE5WREpUVUtCV0NpQi9kNVpoTkJERjdtMk9adWVWd2E0UFlD?=
 =?utf-8?B?OW8vbFpnendyVitZemdwYmpwYlFLQ0Jva1dUd2JiMnY1Snd3bEcxWlV6Zllt?=
 =?utf-8?B?MVQyb2wrNW5tWlhpd1psQjZ3RTYxMEYzTFpPc2t4NnExekZIbWJGNE9ESUxO?=
 =?utf-8?B?cFNzTmlPK2o3aDBseU1sZytsU3FHUG1GMU90UnNwNk1Wd1lkQzh3d2hZN2VE?=
 =?utf-8?B?dmZGaVFGQVEyNCs1TVNKMnRRbkZxeFFUVHJ6MU1qQWlxNDB5dThtWmFGL2Zo?=
 =?utf-8?B?YkhRWG12TGdoVVlyam9nYkhRM2l0SklWWHhyakxoeEdEVkZ2T1JCYmVqN3ZG?=
 =?utf-8?B?czZIOXBjS0tHeUw0c2RCYWNWeVJZTkN0ZzRyNU9WVitZMGN6NjZMeGJ0eHY4?=
 =?utf-8?B?RXhqSW1QV3gwOWlWL0g2QnhvdlF6WVZKVW13NnVkc1diK29vRGFyMzk0UHI4?=
 =?utf-8?B?VDAwU0pnUUIyZnJEaktOcTV0ZUtGcTBRQ1RUQ0RWUm9hWlowamFaVHBTSGxX?=
 =?utf-8?B?RTBQSi9MQkdjcm4vM3llenVRd1RicjdmbTBhTjVmeW9OSWNEVXFDb3V5RFMz?=
 =?utf-8?B?d2hWbnYrWHFoelEyR1VZVXI0ME9EUjRHL29TaDNBeHFmeVhEWDdISlk1Mzg4?=
 =?utf-8?B?cVRwZHFzblgvcS9xZGpSbm4xck94WXBQU1NpZHFFaTZxMVBNUFIvTzdWMUlD?=
 =?utf-8?B?ZXkxN205ZlB1Si94ZEE0QlFqNklIMVZlS3MvZU9ZY21QVjhBK1UwZ1FSZTVJ?=
 =?utf-8?B?Z0tSaVB6S2dGbm5uUWlnWUZoL2RIRkhRWFhMUFVUaE9zVWtJRWZYSlNOS1dz?=
 =?utf-8?B?TnJtcm5tbTlhTHpYeUUyaFhyZmVxNjZ6OWZxcnZ2ek1QMzhtNlRVeE5VK0tT?=
 =?utf-8?B?VzhhUlIwUGRZNEhxdFZpZ2x4eFU4RVFWc0FmNU40SWoxeHQ1WWQ5aUFFSG9Z?=
 =?utf-8?B?Qk5MWE1uNGtFUHlCdE5HakhRbHFScGdxdUpjeFFyc0NOdWpFbk0ycE1ydTl4?=
 =?utf-8?B?ck1VMWpka0M3YStmMDZIZG5NZVRZaHFGY2ppOU91V2srSEpDQXo4QmtuWDN6?=
 =?utf-8?B?bi9jMmVJUWR6eEV2NGJ6ODF5ZExmanZuU2VvNElFUXFjRTRnVkVWUlNsUTBu?=
 =?utf-8?B?aVJFUEhmdXNJN2tBdW9sMGVUa3Fmd2JLUHBCQlBTblRrYzE3ZWd4S3d1dVV5?=
 =?utf-8?B?UXdZcExZdDNOdjd4UjZVTm50MENjalBadFZYZUFoYlFnY2MzaWdWMStqQmRR?=
 =?utf-8?B?VURUTkl5SDJicTJBTUJjNVIzTG4vdVQ1SDhnK0Z5TWFlVVh0amdycnhlSXhS?=
 =?utf-8?B?Y1R5dndWdmhhdnZyYVhHMEpTWi83RWlsV3ZFN2pTKy96VmE4dVNSanZRYTJL?=
 =?utf-8?B?NnV4THBsak02OXppRkYvbS80b0xiYUxpb2wwL1p1dzdxTUFyYnVQdEpST2ZR?=
 =?utf-8?B?eTRva3JzaWs4eHYvUkdJbkM5TVhnTXdQeElnUEZxenZpSStaaUt6MGRBSnR4?=
 =?utf-8?B?d0hXWGxUVnNCUkhxQ1l6Nks2VlhnYW5YTjV1clNLZ1hYWXpnaXBBZ2FIczBG?=
 =?utf-8?B?czZUaWFSQWhmakZJMjJzUWlCWXpXOWl2RHVTUVFvNFE2NlRaYjFJeVRHTWpo?=
 =?utf-8?B?T2xYemRzbGh1RU9FOU1BWEFFSk1HNnZ0UmJTZTVEazFLcGVWSFFHVU1MZEl0?=
 =?utf-8?B?dnFuZDFjVlYvaWhhcCtDSnJtanp6YW1uaEx4bjJXaFdwTitYWkwzQ2lQV3dH?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cd910e-46c9-4bef-3000-08dd9f5b50f3
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 09:21:10.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIn9IWHl7sqvRd+bUunYF5nLrG3LcosM1coOq1KVy3colpAT4KInF39a2lHeSAgl4LiG7xgCJhjEu5sLLw7wa7Yo/zxpYNP82RsYBX/qjJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9122

Hi Marcel,

On Sun, 25 May 2025 21:29:05 +0200
Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
[...]
> > How do you configure systemd? I am having troubles in reproducing
> > your AllowedCPUs configuration... This is an example of what I am
> > trying: sudo systemctl set-property --runtime custom-workload.slice
> > AllowedCPUs=3D1 sudo systemctl set-property --runtime init.scope
> > AllowedCPUs=3D0,2,3 sudo systemctl set-property --runtime
> > system.slice AllowedCPUs=3D0,2,3 sudo systemctl set-property
> > --runtime user.slice AllowedCPUs=3D0,2,3 and then I try to run a
> > SCHED_DEADLINE application with sudo systemd-run --scope -p
> > Slice=3Dcustom-workload.slice <application> =20
>=20
> We just use a bunch of systemd configuration files as follows:
>=20
> [root@localhost ~]# cat /lib/systemd/system/monitor.slice
> # Copyright (C) 2024 Codethink Limited
> # SPDX-License-Identifier: GPL-2.0-only
[...]

So, I copied your *.slice files in /lib/systemd/system (and I added
them to the "Wants=3D" entry of /lib/systemd/system/slices.target,
otherwise the slices are not created), but I am still unable to run
SCHED_DEADLINE applications in these slices.

This is due to the fact that the kernel does not create a new root
domain for these cpusets (probably because the cpusets' CPUs are not
exclusive and the cpuset is not "isolated": for example,
/sys/fs/cgroup/safety1.slice/cpuset.cpus.partition is set to "member",
not to "isolated"). So, the "cpumask_subset(span, p->cpus_ptr)" in
sched_setsched() is still false and the syscall returns -EPERM.


Since I do not know how to obtain an isolated cpuset with cgroup v2 and
systemd, I tried using the old cgroup v1, as described in the
SCHED_DEADLINE documentation.

This worked fine, and enabling SCHED_FLAG_RECLAIM actually reduced the
number of missed deadlines (I tried with a set of periodic tasks having
the same parameters as the ones you described). So, it looks like
reclaiming is working correctly (at least, as far as I can see) when
using cgroup v1 to configure the CPU partitions... Maybe there is some
bug triggered by cgroup v2, or maybe I am misunderstanding your setup.

I think the experiment suggested by Juri can help in understanding
where the issue can be.


			Thanks,
				Luca


> [Unit]
> Description=3DPrioritized slice for the safety monitor.
> Before=3Dslices.target
>=20
> [Slice]
> CPUWeight=3D1000
> AllowedCPUs=3D0
> MemoryAccounting=3Dtrue
> MemoryMin=3D10%
> ManagedOOMPreference=3Domit
>=20
> [Install]
> WantedBy=3Dslices.target
>=20
> [root@localhost ~]# cat /lib/systemd/system/safety1.slice
> # Copyright (C) 2024 Codethink Limited
> # SPDX-License-Identifier: GPL-2.0-only
> [Unit]
> Description=3DSlice for Safety case processes.
> Before=3Dslices.target
>=20
> [Slice]
> CPUWeight=3D1000
> AllowedCPUs=3D1
> MemoryAccounting=3Dtrue
> MemoryMin=3D10%
> ManagedOOMPreference=3Domit
>=20
> [Install]
> WantedBy=3Dslices.target
>=20
> [root@localhost ~]# cat /lib/systemd/system/safety2.slice
> # Copyright (C) 2024 Codethink Limited
> # SPDX-License-Identifier: GPL-2.0-only
> [Unit]
> Description=3DSlice for Safety case processes.
> Before=3Dslices.target
>=20
> [Slice]
> CPUWeight=3D1000
> AllowedCPUs=3D2
> MemoryAccounting=3Dtrue
> MemoryMin=3D10%
> ManagedOOMPreference=3Domit
>=20
> [Install]
> WantedBy=3Dslices.target
>=20
> [root@localhost ~]# cat /lib/systemd/system/safety3.slice
> # Copyright (C) 2024 Codethink Limited
> # SPDX-License-Identifier: GPL-2.0-only
> [Unit]
> Description=3DSlice for Safety case processes.
> Before=3Dslices.target
>=20
> [Slice]
> CPUWeight=3D1000
> AllowedCPUs=3D3
> MemoryAccounting=3Dtrue
> MemoryMin=3D10%
> ManagedOOMPreference=3Domit
>=20
> [Install]
> WantedBy=3Dslices.target
>=20
> [root@localhost ~]# cat /lib/systemd/system/system.slice=20
> # Copyright (C) 2024 Codethink Limited
> # SPDX-License-Identifier: GPL-2.0-only
>=20
> #
> # This slice will control all processes started by systemd by
> # default.
> #
>=20
> [Unit]
> Description=3DSystem Slice
> Documentation=3Dman:systemd.special(7)
> Before=3Dslices.target
>=20
> [Slice]
> CPUQuota=3D150%
> AllowedCPUs=3D0
> MemoryAccounting=3Dtrue
> MemoryMax=3D80%
> ManagedOOMSwap=3Dkill
> ManagedOOMMemoryPressure=3Dkill
>=20
> [root@localhost ~]# cat /lib/systemd/system/user.slice=20
> # Copyright (C) 2024 Codethink Limited
> # SPDX-License-Identifier: GPL-2.0-only
>=20
> #
> # This slice will control all processes started by systemd-logind
> #
>=20
> [Unit]
> Description=3DUser and Session Slice
> Documentation=3Dman:systemd.special(7)
> Before=3Dslices.target
>=20
> [Slice]
> CPUQuota=3D25%
> AllowedCPUs=3D0
> MemoryAccounting=3Dtrue
> MemoryMax=3D80%
> ManagedOOMSwap=3Dkill
> ManagedOOMMemoryPressure=3Dkill
>=20
> > However, this does not work because systemd is not creating an
> > isolated cpuset... So, the root domain still contains CPUs 0-3, and
> > the "custom-workload.slice" cpuset only has CPU 1. Hence, the check
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * Don't allow tasks with an affinity mask
> > smaller than
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * the entire root_domain to become
> > SCHED_DEADLINE. We
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * will also fail if there's no bandwidth
> > available. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!=
cpumask_subset(span, p->cpus_ptr) ||
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 rq->rd->dl_bw.bw =3D=3D 0) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D -EPERM;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > in sched_setsched() fails.
> >=20
> >=20
> > How are you configuring the cpusets? =20
>=20
> See above.
>=20
> > Also, which kernel version are you using?
> > (sorry if you already posted this information in previous emails
> > and I am missing something obvious) =20
>=20
> Not even sure, whether I explicitly mentioned that other than that we
> are always running latest stable.
>=20
> Two months ago when we last run some extensive tests on this it was
> actually v6.13.6.
>=20
> > 			Thanks, =20
>=20
> Thank you!
>=20
> > 				Luca =20
>=20
> Cheers
>=20
> Marcel

