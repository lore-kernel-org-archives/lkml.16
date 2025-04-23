Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28F1EB5E6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411470; cv=fail; b=YvWWhYmfXGIxPKDxJARgQW+M0yfY+ZBqmfVGbC+wJyLoVu3naduxs8D7Zn7yAN4WNpvkdghFUUkpyEv00xcwmjXAClRdOBnzSrGR8aJauZLgM2oLjfVHgzR2tXU4BgFVZXNtasL13QtoGJCHmZT4lf6duU+UJmXOH66rn2qttMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411470; c=relaxed/simple;
	bh=CZXrHnVTsxpqvFPRwwUJZR5DNX7Ri4LFlPmSGIx6Q8I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KDGAbFk2jnoni5CNPG5/7Te/vNOrEWE+eltasQhZmO/N3BU1lI4Dkohs9841T+eWs5tZOL5ih/Jb4LIxqmp3BC9xWfXCeruBjxBkxEX2fdoZOoascZWfnqQwA7U4WB3GQzwuNJd2/mWJrKGFz0ko+n6Nrgdng4xMtM7JFKEFtqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dCeWP3zm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g0wVqqBU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dCeWP3zm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g0wVqqBU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N8fl8Z031452;
	Wed, 23 Apr 2025 12:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=LLgdXTaNF+70ugdN
	3RvjhGR/UWCrtYmYyM8gBPSRWl8=; b=dCeWP3zmcG1slPZ3x0mzs0ju4/fB54+K
	kepADzm72GEe4SZZY8MADcxOujn3dP/NqBb4v8UWd6JEutjoVgaRkTFoitq6L4Nj
	Cjppvg181PgZcDpqlp1g1B/4GEDxQApwPkV9PxCltpgnvauztLPzCWpSPCBfHRtc
	od26RfgA4pGMMd1NFrgrpv3SVvSxHwakiUJYr/t4J+UpVqpc5VdzGq/zc7vcOeDg
	9m3OonBig7jj/dP5wAn7KPVA7J9jTIDxZ+Hi0MlFKO4gAM4LeAPuC8uIkQHjtB1W
	O/fMMIaFmCvWDCNtG5nT+0+UE4ZyQHOFQmBitD9yNMpJpIbCWc0sEA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jha148m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 12:30:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBsVfg013879;
	Wed, 23 Apr 2025 12:30:52 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012050.outbound.protection.outlook.com [40.93.20.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxns6g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 12:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQY4XDIHGIrgqp7QSVKArQMA2haosOduhFHSWesL25m7Tw4H1nZNyu2wE0iBWnMrpKAYkmyOzJICAoBqx2+dVh8qgE2l5AWLx5s8yFgpi4DBv8F0lI9OqwJQncT3/6EnJhDqbA9qmSBQIo5DcdxvjPKrlnRRNesRvM5fiq4EawtioSR+mb7PGCR35YPrCYYtjLK7WZmM+qGNCxfhgBscu0exJBRWEtVmn9z7dw5sm4Nf//PQVwHS1vUgW1N36i/kpyu8Z0RdMJbkq0G3yYfb9BsS0OCpemGbA9YB8YJ/Sx/5/Yg2L+twVOXRldHleclBkHrpYg2jP7gQW6A2fRoC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLgdXTaNF+70ugdN3RvjhGR/UWCrtYmYyM8gBPSRWl8=;
 b=Zteiq+bLbPxocVz5PhW3vM1haoCgobRHswyJvFlMsd8WqhiBF/GXxrVQsQjPqKbCHBN9o9GYImy1BRt43Ep6qdYdGGKVof7n+UahO/sJ8HbES1dS2Dnjy0FBp0bQ4NATc6PFmtHE7UtadOlmQSZupGQ+pIbGUsLjhPKKCRcHwXtTpCPCEAXexraGfiEY5iNR8N3d9xnS7bQs/f5PoIhRLIOjTQoFXWSNoRzf8iPpoxl6pBGXo5IfYdjntXeLdKAW60xYFHhGN1TzVWVCW4IVwK1/ER4ARejOtgCIcSR64qyJhxUYHqZVuyxvmhjL2wzhwZn1OIVbdJY5symEzQelbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLgdXTaNF+70ugdN3RvjhGR/UWCrtYmYyM8gBPSRWl8=;
 b=g0wVqqBU8C15jEY8CeSR4cT+TiE7XpKO7Cf5Bs0oK9KUwVWAsEz6kBZp7Dtd8ca+Mk+WDLdQaIOeHjmPlCGsoA5NSMcnv89RDJCsxFX+VbExtOM7Z/kt/GgzJvrGG1y1H6U0UKqhXfOZYdPNNHE2qm+1UNKyyzU190DiJGqga68=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB4998.namprd10.prod.outlook.com (2603:10b6:408:120::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 12:30:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 12:30:49 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add core mm section
Date: Wed, 23 Apr 2025 13:30:42 +0100
Message-ID: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1f1100-4755-47f3-6b30-08dd8262ae12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N3Ylg1uTFtzvD52ZEQXh4OQHoQnzkYmI1EmCbSUFheT9Yc26Mky2ll0YrR4X?=
 =?us-ascii?Q?iAaM5RjqGyzdcJd/j8J6EMAO7yjG0bLzwb+1n0Dfd7SUr83Rl23pwjb5bvW0?=
 =?us-ascii?Q?hVuHamqJRralyePpvmybFFj+cMe57P/s4zDJx/IMHDSlTvTk8nNNcPY62XvR?=
 =?us-ascii?Q?ILbZ7My+gPsTl7pDGAeEkVdZWk7WnhM9U786knCh/v3zCWX9eq4w7GNS7CL3?=
 =?us-ascii?Q?7EMT820xaSqFJihFVuc3ZD2SQSHRyvseKmaZ4PAc4nFYXHu7XCJgLpC5e1vD?=
 =?us-ascii?Q?IqYBjkEDw5KR8JEa74GwvtabP1HAbgrkVxFODZbRhapi9hOobbzJdOBwZdfQ?=
 =?us-ascii?Q?XHQ4W9sYPVq4lzrCahOa3EoJfbyoGzUBz+lGUXsTGb6Jg7zdwN8dZMsiA4v/?=
 =?us-ascii?Q?J+hnxGtkGKHiqzy90khLKwykthfgjLUcxegKaiqUWbFYTCtEN4HOHmRCHaSE?=
 =?us-ascii?Q?vAsCNcZUU659IH/+yZK1SB0MZ2PLi1hQTkazXFYv7xIll626VZ8fJkhmEQRz?=
 =?us-ascii?Q?6QsM4G3bT872hxDYffYFtaPbwSl7+gPwOhOEUUhcuUiBpx4AfWhk7nU3safV?=
 =?us-ascii?Q?D7202J2WUzkZk8IPh8fignUWUgZnWVCmWEvCsjIuWQADzvDYqHcNr70Fb4+C?=
 =?us-ascii?Q?BtdfApXpZp9sEsbOhANNNxR0hbHDOGwn8Uqpdn5y+6DJclDLA2v1tOaSQZBc?=
 =?us-ascii?Q?soDcnt07R7+q8IGtGptDWUGCBzNETXGOVYFitk/JI9Yecn1XwcNLGWrt9Yea?=
 =?us-ascii?Q?1uSHgluHRcSMHgvKj6gr3rqjIVm3pstmcxf9roU44l4XMrGkF1/Rlbo0+C/7?=
 =?us-ascii?Q?uDBBnnGWjwLfDJA644k5CrBzFfwBbfRYSUyTQw0fSczbiByv3PXNIbOfG3GK?=
 =?us-ascii?Q?pxcx6JxpJS1gqEqlPnmC7aJwzJxFKylYfuhUSf1zl9ShOHA8WKexjz5+8o9m?=
 =?us-ascii?Q?k3XTwxElCB5favxmSszcRgFMfED965JdaC2PD9Sfu7T+BP9qCW2UBdf6iFGi?=
 =?us-ascii?Q?CJaCK5tGNtYnP15geYk13Gc8DK8U9bk5AF1Jv4+RIuitThBqg96P1YKqmWaK?=
 =?us-ascii?Q?JkEaTT1FPoYfvdbb2cgmehZPZGUNKfli4aeTMD5XhzwFK2uOioyKVBBZro+t?=
 =?us-ascii?Q?a3oNyIoHHRMcqQQTHecRSG4H2yWz8uLT6lcSLtpyzejfm0a3InM1AqILC6vM?=
 =?us-ascii?Q?tPk0p94/rDWwFkwttCIMnmqxWIpKMCJy3FqvWSU6yGoak9a6S5etwuDy/a0E?=
 =?us-ascii?Q?e6mYthrqOV5vjs8SQkzsdW7CO5+Fn8u5qNcJ4lB1W8XkjilVLtGdm+saPUBv?=
 =?us-ascii?Q?mUM88CWzjf0PMDmoI+jR7qtsvzXc1fjRAUkXOAPGd6M3H0820gZHRe2+v89y?=
 =?us-ascii?Q?JvJ+x4c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zSovi7Gr/d4woMGOxXtYxM+7oMrxIYM0b999OS888dnQfX4GSqCDTZ7wXWDF?=
 =?us-ascii?Q?YPGG1X0OHsf7lmlzlJ5xPUkTPLw3j1q+sdQ3+AeQPW0l995PixR65OxN5SQj?=
 =?us-ascii?Q?HvEUOJnz9bJIWUfdp1Q0fH6QlSy1QNV++L7UT9mfqLMx0cJ8Mq8Rw1phUiFM?=
 =?us-ascii?Q?3ewB1CGqmEaf21c5cqgCB1PcLswx5pmupi+/ubVkcErayTq8JGh9KGEJJd8A?=
 =?us-ascii?Q?iazMHRk4xVnmiN31o0vGWOBhXuM6lqrjwik2bdTOtN30c7uBXHAzGHwWBPV3?=
 =?us-ascii?Q?NvMucvAWbPnKJEBFJxsvL6LekPNykCozq1n3kzo5Ik1I+qbb4daGKUzCxuGD?=
 =?us-ascii?Q?HcP64cYf/YnIERr0ghM4M/pQ2u/CMiUh3M/OcBtgeowNibbQBx1e6FpU4WOR?=
 =?us-ascii?Q?BLw2EHZdgIF4JK/XCw9NaIerbpxDhTy0SJLXks+fwc6d3KcsR69QPrxAhCTG?=
 =?us-ascii?Q?sQ+mvZi2oxq6GZtxc1p59wyxmuIHeNdvuvv47TeL+Of65ubccuGCmBt9Yjjl?=
 =?us-ascii?Q?bXwS4Vg9aOEeZ0wSBO057SFPf5duAsTzZbOPrNVeGypQQchjuseQw+DQH7zh?=
 =?us-ascii?Q?Xt4xGlA9f1Nfl3Sq4X67ZHPXTrMRF76ZpJIYIuV88JZ6W1GNOVkRQZS4+gZ5?=
 =?us-ascii?Q?zcoDit/Uh/mTahABdKHPRhZgK2VM0PH7axflNEkdK7Q5+kbmNbdEAgSmB178?=
 =?us-ascii?Q?hzbRUIiWSpx/YW5c4QMPMXQHa24ti3pBa3ORu65ykLk3lMYav23M+ptctRH0?=
 =?us-ascii?Q?4K0dnk9/yQHqu5FN8qIhJ3/j7H0sdoAPVHnT4inR+LSXGWFJhTP3fojI7vtt?=
 =?us-ascii?Q?yu1wITNWVRSIVJQWc3a9rGx5kKmyky3X82Nw7j1UCJRbJ7g2ICgacLUSs3G6?=
 =?us-ascii?Q?qMvZqqpwSJjXtizwNCYN2X+oUKWKn6pFUiVdAHaicIXUluu1L87nNchEvyyr?=
 =?us-ascii?Q?n45o+RmbJ3hgaF7EVfx8wXzVLah4B3XALa12Z4fdc14gidltEYQGX5FZ4xU7?=
 =?us-ascii?Q?0rQfN34YBMm4wYsM4xKuALD0/Zs1Og1PMIQzEu3avx6L6FY5NL12AEFqm+Ti?=
 =?us-ascii?Q?df+fs6i94F+GHbQ3U+m60YEPdrv7vZXPJgJJMr0HFgs5VqTEGCFKIDjAh8di?=
 =?us-ascii?Q?0RyyGbcQwKb0WEjnSq9wtx+qqzaQw2iZbGbSrajUQW3R1eopFA9MJCPgkgM+?=
 =?us-ascii?Q?Y+0q1FSjNoeyQhDLYrQs1BzZm+mEPGsEiFz7SkOxJr/P5Oiwam4upjz4whAn?=
 =?us-ascii?Q?LeFm+gMELPjCO/HukF28FgWtJC31cwXLWaSTkIUbH06iRm4NMOk081kmKBiT?=
 =?us-ascii?Q?NbYRXjFt7CNXrVhTxO2p5qcuJtepQOxykkgQePyro9owHWIS3Yir0TMinyam?=
 =?us-ascii?Q?oooRpq27ahH1MIRsPi4hcelkUlahb/tyFh6eK7CUJu+R+G4uOhY2sA6rzRsQ?=
 =?us-ascii?Q?hRKosBmnrbW1QYoHm0WRgISKxMu4lQTYw1oUKMAdVoPYjEdrPY50rNYQc7jq?=
 =?us-ascii?Q?rDkITuVgXYV8tVcD+oyKASllJyqQ5lkodMwGY6JLrqGc21ZCieJ7xNBT6Nwn?=
 =?us-ascii?Q?l/6sAM4eQojnX2hJuojAUKK0foA6XhWLZ4I8QzUDAipfGFAmt7o94RnQY0TN?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9x0OKSi9NnJmu4EksAHDmAHzjpr++VJKaCZBr0OnMIddH2ADhyzGkvMkDPlgcrDr+8nQDwfbbI2PheLZjdRVpr2iwboVQrIIsbv5A9aTPEA9zQxeJHnSbyBOn00aKiSv7IkJaMQaLX/R5JDt+Er0fj2DcxUApeOKN/Q0K4r/0XsmqRZmy92tPC4oZgLA2oBrzJ49xnW3sB4M4hBueYtOESonWYZE2ddIpxICPZ75XTlThmc8TT7RJUVvWjenWpbNWmLYPAFRVgTK7+UPZeUVtKFbecvryGv2VRInRQc45iuIuS9n+gUDTg+Y2VfxJrq2zi4ErflP9taBVAaIAeNmhA8iFEmQqflTmLsmN/+7zmOPkMTC5hGCBTn7WyypQ2A04RnQqutGPbs2cPHuudmbj5Bk1GYlqHvwUdYAbAxBJTgFsD4CkF12UqEqldDP/q2vecz//IoYM/zzz/MeN1bxf2zs7P/FMITYgM2ljGJw98RyfmX3hvPI+khYFReYbHaKed3j04e2oVxgHOcPYlokreo9r/gpZ9jMx8t0csvTlQ1h/Uzg9UxG2M4Pg4MlB06iWRSFlJJv3A/P27siVZ6DvMCjZhHpgpeMcLdgkj31pgo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1f1100-4755-47f3-6b30-08dd8262ae12
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:30:49.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSNnX4Mb0R7MJEW8hBlwcOi6WIH8DD5exaXh/8CRWFXUHI0XBouYLTo+F2aZqpFUtnfm0+YuOgQOcNIWPXl7L3+W4OBLS/q2kwKKogSt4C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4998
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NiBTYWx0ZWRfX2Fb9aga2F4NO 7wRca3+ZXoL7rrgU3JdmN+t7PDhsXQ97LNBMF6jO3QK5tTE4Z5DqeUyBd/R0/2Ceb5m42MQBFLy UyovUtOR/fUcI3OHJKsfSiAMYVZSM4WJHgsdmAI4KJDijbda2LkMGW5Syus/WBvR4W1RIUSRLtP
 XMDcaeiw86k5hBIUBirIWztabb4119+0Q4rE9DAWCGy22Rv1gq/+UuDOJ8f6C4pQl65nFS1ivBY d1WLXg3g1bWc2K6NAC5MEFSj7euqH/u/HxmE6zDzv6hhK4Q7I/HVIuRGIJMvFPh114iAAMF/IU4 +1wd49OxxTfRJMjhKRs0ohciMocjeb829qitVeYRwUnE+0P329/E/PaDkneuZGp6ywXWVKDGmWf ZjawEqvx
X-Proofpoint-GUID: Mqf2cvlXNoK7EjgxoH0Hi6U4O5ZljX_o
X-Proofpoint-ORIG-GUID: Mqf2cvlXNoK7EjgxoH0Hi6U4O5ZljX_o

In furtherance of ongoing efforts to ensure people are aware of who
de-facto maintains/has an interest in specific parts of mm, as well trying
to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
files - establish a 'core' memory management section establishing David as
co-maintainer alongside Andrew (thanks David for volunteering!) along with
a number of relevant reviewers.

We try to keep things as fine-grained as possible, so we place only
obviously 'general' mm things here. For files which are specific to a
particular part of mm, we prefer new entries.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 MAINTAINERS | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4015227645cc..632f2860f1cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15492,14 +15492,11 @@ F:	Documentation/mm/
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
 F:	include/linux/memfd.h
-F:	include/linux/memory.h
 F:	include/linux/memory_hotplug.h
 F:	include/linux/memory-tiers.h
 F:	include/linux/mempolicy.h
 F:	include/linux/mempool.h
 F:	include/linux/memremap.h
-F:	include/linux/mm.h
-F:	include/linux/mm_*.h
 F:	include/linux/mmzone.h
 F:	include/linux/mmu_notifier.h
 F:	include/linux/pagewalk.h
@@ -15509,6 +15506,31 @@ F:	tools/mm/
 F:	tools/testing/selftests/mm/
 N:	include/linux/page[-_]*

+MEMORY MANAGEMENT - CORE
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Liam R. Howlett <Liam.Howlett@oracle.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+R:	Mike Rapoport <rppt@kernel.org>
+R:	Suren Baghdasaryan <surenb@google.com>
+R:	Michal Hocko <mhocko@suse.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/memory.h
+F:	include/linux/mm.h
+F:	include/linux/mm_*.h
+F:	include/linux/mmdebug.h
+F:	include/linux/pagewalk.h
+F:	mm/Kconfig
+F:	mm/debug.c
+F:	mm/init-mm.c
+F:	mm/memory.c
+F:	mm/pagewalk.c
+F:	mm/util.c
+
 MEMORY MANAGEMENT - EXECMEM
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
--
2.49.0
