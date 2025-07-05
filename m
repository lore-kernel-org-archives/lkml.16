Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11684039
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677200; cv=fail; b=dtbhtmmGxJ4SttpkHrLGOutSY8gcbs6bHGyjqRwwhb1XpVlsOWS+Eki7So6O7G+ZED891qA6rm+hLa3mrr+xE4kQg5QmA4evvZPuBox1rXSdFSt1s/ZUIDuBiC1TuhiZltM7+trJWiSmX1YgX0l9vdrF0OwTt3Z5ZkbJRwbuxuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677200; c=relaxed/simple;
	bh=YJzVM1McDp3ifazYWKmZTN4SaklAUyE6YKsmq/ZdWw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SMfYfi2XT7XYa6U9YHlIO7iEtmr/CDpNSfsvQOWcYr59ryf8jxaIyqpK9R67gId0CNvPcVTuyDPWoo6VP5V++FgD7az9hU0n/ymF7/945UD4zH3gqERJWX8yK2usXt5gYPexdwVUXEwvIvFVQltHaCCD7ZW2sn3KpK4Cvejt2XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=eAe/OLiK; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=fNS+tVSy; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="eAe/OLiK";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="fNS+tVSy"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mJ017370;
	Fri, 4 Jul 2025 19:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=cYEL8pBgfR6bC9LiB7XkCS4rGyaUEohwSYu6kpQ0jmQ=; b=eAe/OLiKBB4J
	xrrdxRDRG2HhKVGTEEl462Nn+sHKcdaWpvIQ4+51CsMlyEvHgZIugmm3qLMj2mCp
	HwVa3EKaUcx/XgqYuSuVvH2xGp5IFPYaPUrfOs+Tto01aekmYmrW+1O/Vt6lq0SS
	OVPJWjq+WCXIlVuqdMHFmaIl58JThFqjvclBcHuP9R8Cyq2LlSVTtpGosSeeEEbN
	x1h62yjEOltxlQ2QbQVSiACON2OCYXP3+ueW8oxGIofhAXc+dmTGELxgQZHkSmBl
	CqcKO09qZKnj6wyRnDxInTxhkPJFzkzoJO//3o/8IUJbun+J19dvrGvoVIYTrt4j
	atDC76GHJw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LteX+gqS8of3i+rkY7WkU4+nBG7Gk9E5594OxCZZxgwYMgDy1NiY0dAuxdqFzBLlUpgSeiJYIClitq2RHz2EjGn/Scy9m5vyZing3uLDyzP0/3WD90sI9ZFoc+PLpsP5ACHM1LSigGeIJ9acw6wkFQPkbJBFRYYFpnE4fflKPVXazNJzytEUQaCjszbV2D4C/ZqYSCmYnKOyJm/hEYHa3Go5h6/+HsLzlst7Krb4iFWpe+260HtBIY7JR7xozAt+qX0B+EYSp5qmY+Zqc7Y6baVCkQfm0IbxxiqiDcTDORsIH6GuU9316M7A+0GdETjRBqnl2rGHN7CmdSyjnknDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYEL8pBgfR6bC9LiB7XkCS4rGyaUEohwSYu6kpQ0jmQ=;
 b=TCqMQ01B5k1htCyPB7Hk4DtFGU2i7JX+GjXWNuQVz0WFyHRf+VGOuOvTVZ/uTuykHemoPWQnzTpgK/jvmVbR/Xj4bReub89ksNxEcK4aCppiQL2D2YqUBQmYlEV8N4wYdqOs+Tu7RL2bK5JdLeef52zxiFLmtQ98ZairL3JuhSeBGzpHYnR2wSZDZ/npJtmQU5DsV6HqFwacEtJI8moSTkOQeSnAVxpNoijNCNs9T/aTVCTkJ+tGAqmV/JpD58QT5BjoPNLGWJcTcPVfDNxxjqkdqTevNGPgjrocE9Jtwow4vDSp5MA2q5yCeVra296N95/ozYuKxfFoRg+Ogzep9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYEL8pBgfR6bC9LiB7XkCS4rGyaUEohwSYu6kpQ0jmQ=;
 b=fNS+tVSyQT3zQ9tOoRV8jpiPYBnPMLPgTXPLYM9ionjUtOk0NMgP3vbMSbuLnQaPBusJYMR1gkr664uT25qG/XH6AGHU/NianTt2X4pnX3G6++1TvKRb33N0/loNh+GxnWgeGxYzGfF2p17uRb8EW5Hlx9991eTNmtSIV8ZZvdY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:54 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:54 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Cc: linux-kernel@vger.kernel.org, linux-devel@silabs.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [RFC 6/6] greybus: add class driver for Silabs Bluetooth
Date: Fri,  4 Jul 2025 20:40:36 -0400
Message-ID: <20250705004036.3828-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bd3066-eb2f-40dd-880c-08ddbb5c9997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUpmSjIreHNlMkJmLzlRRXhHelJjcTBDejlrQjduY0Jzc2ZpOE1VcTN1RHkv?=
 =?utf-8?B?U04zczI0azRjSlM4cXdFY08rRE1Va2pBdmRMbzZYWkhGL1FKQWx3cnkwMTNQ?=
 =?utf-8?B?K2N2MHpNTEx4aUZIVGlJakZDWm5pWlQyNXk2eXZIbmZaMmZ1QTI2VmkrNExv?=
 =?utf-8?B?RmFRTUJqYjNpa2lRZCsvc1FuQng1ZDMrbzNrd3ZwazR3MGd0ay9HSXl3aXFY?=
 =?utf-8?B?bURvcC9PSU1FQjUxOGo5Q3dKWUJQNEpXdEs0dUhMeWh0M1VkdnBLYWVYcis5?=
 =?utf-8?B?WG1kcVFjNkpFU2hnVlJlUEZLZW5wRjcydkZtMGVyWURVcGxKWkx0Z1ZjWkhC?=
 =?utf-8?B?OEVyWjBBbUp6WlVTdXZ2U0N5RE9WWVo0V1pXSnNUcW9tSm5EaFRCRjQ5akdi?=
 =?utf-8?B?bTdrMUpKbVM0YWJsbUM3OXZyUHUxK1M2TDYwTDIrK0RiZC9qWjdnK1NIbEdH?=
 =?utf-8?B?TWUrVU9COWxIMGtQa1NZajZHSlV2WjdHeVU1Sjh2aHhlVm1BaDRJWjFkd0xk?=
 =?utf-8?B?Q1NucGQrQ2FtcVRJOVdURzczWFREYnJ2YlR3dTcyTVVIMUtjU1RyMEpqcmlq?=
 =?utf-8?B?NVlUdThYenB3SFhJamZZRHVhMEZrUTFFZVNuQVVlaXBWZktyVWxielJwU1Y1?=
 =?utf-8?B?K3hCb1F6WnI3N0EzKys3dkJGR1JXOGFCZVZBOHV5ejFTaGZQOHJCY0VGWE5r?=
 =?utf-8?B?V1JSSUpweHJqdjIyZ05hTC9ZeGpwSERZcENnejM3S0JxVmFSeU5NK0Nram5N?=
 =?utf-8?B?eSt5YW13K2ZZc0k4V29odXBXNFJ5UDVQNFdSZEdLcjAwOG5zdEZGQWlOUDZK?=
 =?utf-8?B?UVlZOXN3T0RzdDJYeTRlVU5NRk4ydDlRSHIrRjJ6MTU5NVlmSFVpZW5kSktM?=
 =?utf-8?B?UVFqcFMvNGRMU3kraTVjb00wdk5NVTZWZ2RrQVhWbTlJR0xWRHNhYUVVdXNS?=
 =?utf-8?B?RjRrcm9xd1FxS09GYkV6cG1oUXYvSEdRTkgwUy9rYi9SODBpNFFkUVZ5Z2JD?=
 =?utf-8?B?RlR0MldoNUNwVS9EYTZOTnFlZ3h0L1ZsS3kxVlVSRWw0RjZ5VEx0SUozcmlG?=
 =?utf-8?B?V2ZVYjdndnRmRVhLbE90VFdiR2pOV3dueno0QkxzT3BaR25VVnl3NVQ4K2VZ?=
 =?utf-8?B?MDdwOVdRTldZdEhsSmZ0MFJkSXl3aG9kcTNSZWV6cW5UaTBBSFJDVFE2WGY4?=
 =?utf-8?B?bkUwbUNOUWpKWENqcFBHWVJocm1MOERSNkhSbDlpcEQxQjFXV0Vlc0U2dFpv?=
 =?utf-8?B?eUZrbXQxdGlmTDdkaDBURVZWekdBTXR6UVRQRTBxMTFERlRwekdOM01McExy?=
 =?utf-8?B?SitYdks2ak1DYTl1cHZOZlVHNGI4OFBMV2VWc1J2Q1pXL1FTM3M1SzNQOXN4?=
 =?utf-8?B?TjZkTG5iQkRCTjk5SE5BUExZSHhzbkhwS0ZuNE1POWQzcjAxNCthNVlLTE5I?=
 =?utf-8?B?a0pVVnRQUG5zdy9wRXNtRWcycnB6UWozQ09MLzQwVUVtS3oydzFPSDF1d01X?=
 =?utf-8?B?enM5U01hdVpWaHorSU50TUE5aE00aWVkTWQ0aytrYmVOejQvMHVtaVQ4RWcr?=
 =?utf-8?B?aVlkaG40NmtSeWJDWUprU1RtaE9KWCtadWRobkd1RFQ4YzgrYnNaQmZvelRo?=
 =?utf-8?B?c3Jlb3JJMEZ5TmdYdW1Eb3NuYVF5Ti9MYlAvOHNuL0o3ZlRsaWRMS2ZzWVNl?=
 =?utf-8?B?VXl1Mm5hNzhobkVhRC9zWVdjTjE4ZHRoTGczVlA4Q1NxZXFEVnM4LytsZFpF?=
 =?utf-8?B?Z3FkRnVqeXpNT3ZJNHNRWnd5ZW9ubEs3T253QXZYaXorbUFIbVgrRTJPZjQr?=
 =?utf-8?B?STFzM1R5QmtKTXc0WEFVYmpVVmFvUi9QSTR3SGhWRWkwei9tdUY5QmZ0V240?=
 =?utf-8?B?QWYrOUVZY1RiVHN0TU5qaExBa0tlSGgvd1JxeUtWeDhCZmlVL2YvYVl3WVZw?=
 =?utf-8?B?Rm1LREQ5ZlJGTi9ESWlXbG1qYzNzbnVxN0lRWEEwZ05WTzEwQnJyWitURkFV?=
 =?utf-8?Q?7syh8OqOfBSdq3n1PocZzzl2F6A3kI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUcvREZYcDA5TWJsTVZpSDZzSUJ3elpLaElnNHdzRVBsWkR0dUZlNE00TkJz?=
 =?utf-8?B?a3gxRUVHTlIyVXBROEw5UW0rMFI3aDZYNlRpOGRKRGo0UFNNYlpFTzNxeTV1?=
 =?utf-8?B?ZHBqRnFCSlR5RUJnRjZHaXZwdEJpNGV5YU1jbTVQUEFDSmxCcEREQk5yTE0y?=
 =?utf-8?B?WUQxVERZTlE1eS9oN25EMDIwT2gycjdtcm5CWkF4a2VUelR2VTZLUTVWd040?=
 =?utf-8?B?RUZGbHlLM2RzTFJUMkZBVlNITVNNWkEzMVVhZGdXc0dzcVE1VXNQUGkyVk5C?=
 =?utf-8?B?NWF1MjBSOHg0K1BMYW1Tak5tQkFveStoMHFPb3lhZTZvcnZ5NmFPRnZ6R1pD?=
 =?utf-8?B?ekJPQmsvMk5Ra2RvbThvU1VyNkd5UXJxN28wS1pudnR4cWNWbUZPVzVYZWFH?=
 =?utf-8?B?b3dKZjdNRFRLeGk1ZGFnQ2VtMk53R2xMWHE4WVhrU1BsNmdWVE1vV2hqWUxp?=
 =?utf-8?B?Und3ZDVGUHdaVUtMbWJQeWdIM3RJaTBsVEV1Wm1RVFlZeXJoNW14TFVmTE1x?=
 =?utf-8?B?TkM4TDlNYWtEWXptNE5XeWRFRWNIRjRPZU5NZGFSOW1tYk1wZFNOcTJmUlgr?=
 =?utf-8?B?WUhKRlYzenhYSktlRFJZbmk3bFNSS3pXUmdIbHRvT2NGRWkvR3NadjVvSkYr?=
 =?utf-8?B?b2ZST2FpVWFDd05RS1IzaSt5bXA0QWlFRUozVGZ2bXM5UTdnVWdQbU9zNXVq?=
 =?utf-8?B?dU54SDUzTnc5Z2hmOG9CeVBLRk42cVAwZkxkOW5tSG9xbXZDMEQyVUpQTkwy?=
 =?utf-8?B?K1dIYThHRzBvSE0vQ29EZ1ZhVzlkazdQd0MxZW9MZnMzcElYcWRPd0dOMk9P?=
 =?utf-8?B?bi93Sm90OStYOC9yeFVLdjloVVBQVEVDS0ZQYnNTZG5kblBmU3VZcGpHTmRR?=
 =?utf-8?B?STZxVW53aEUweGV5QnZLVEZXc2pzMFM0V0JORmxYY3puUC9OZXBxVElrVTJZ?=
 =?utf-8?B?cjNncXVna0VlVHd3NVpsb2t0VzhQTy9VYjczWVloaW1FTEtnM1Z5NWlRWHph?=
 =?utf-8?B?UU9FVFdCR0VBOXFQdjZTYkthYVJyWlVianU5VzZQVmd3Zi9WR2xZTTJCdGhW?=
 =?utf-8?B?eFNQS0FjTmorUEpNUTZVdzdYZE1SeEFqZHFYN1J3cWg2VlJ4cHlJM3JLT3RP?=
 =?utf-8?B?V0drajJNdVJuTXE2ck1jc2h2ZXBGL3dLdWtwRTVBSzIxQTdXVXZhVGhndmdC?=
 =?utf-8?B?RFVZNkRNTnBkZFRxL0F4VXpMU3N5a1AvL0JQWTdBV3A0L2crR0NpMlJ5bHl0?=
 =?utf-8?B?dnk4T0RtSmNsR1dVT3A5RlZMelRZaXN1cEJxWXJxaHBjZWk0NUgrMnV1Y1V4?=
 =?utf-8?B?MVJCOHJWQ0N2dHdlb213bUkzZW5lYTJSQ3RTc0hJNlpycURCaVdGVkc5TFRU?=
 =?utf-8?B?WXJNL215V2RSalFUWXNsV1JUTUFFaElYZkNOZ05aZHRiTWtFdXQ5bEVxbHFx?=
 =?utf-8?B?b2RGSTlOL3J5V21ZOU5vOS9NUXNSME5IN25MdmIzTWEzR3B0THdNdzlYR3V4?=
 =?utf-8?B?ZjVBZitHSFFaVUJDZFNYZkJtTGNsNXpjWUREREptK2lQMjVPSkRiZGplcEx1?=
 =?utf-8?B?blA1MUlOZzZjbEFFd0tLRityVUxVMW1iU3UrYlNTc2Rac2lJVWVQZlVNZUs1?=
 =?utf-8?B?azhsTHFnc3ZHVk5ZSHptVDNpTlQwT3dFQk1vNEdVRHNHT3BCTktnZnc3ckRF?=
 =?utf-8?B?cElBWjVtNS9CWW5nSlNxQzZtUjhCOU1sRDNBOGpvbEFOTi9hVzg4bG9WaTUr?=
 =?utf-8?B?azFCUnhYc29rbk5YWUhGSW9EZEFLWlhBdGVCclNhaFJDNXp3R0ZtaG9pMUdB?=
 =?utf-8?B?bERZQ1VmMytHd0R1UVlVbzRrTVpZL3FCdm1NTi9BOVRoQkpIaDFMQTV5K0lr?=
 =?utf-8?B?VGZFdFlWSGhGNDB4QjRFYlNodGk1SUl4NXJPVzVSd2UvYWVIZ0dHemlWbUVJ?=
 =?utf-8?B?N2J4VXhrSjc4cmVEQTFHOFUwZEloSHNJanV1Y0l4V2dZT0JzWjlSQlk1NUI0?=
 =?utf-8?B?L0xDelNqMDA5cytFZXZyNVVBbmxVcVRJazFXemxZQXVuMkZ2ZDlleGZFMDNQ?=
 =?utf-8?B?MEg2WUppWkk3czViTlVuWWdXL2xQUEpGTnc0ZmdwWGdtYS9BcEdSQWFuZm5B?=
 =?utf-8?Q?hFR9s42z9nyLUyNTvW9ZOs9KP?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bd3066-eb2f-40dd-880c-08ddbb5c9997
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:54.6027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXtUmnxD4x1Oa2+vgT6lgZgeERtqeDj5HC9Cmxc0xhgTgSz3NRyarotJjPBVY98mludiagStOjl8MCqbtzaAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687499 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=NEAV23lmAAAA:8 a=2AEO0YjSAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=H03fXF6sB4HNYwN3RssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VbUqaPDpo_pFWuQgZYpQiF89WrLstDek
X-Proofpoint-ORIG-GUID: VbUqaPDpo_pFWuQgZYpQiF89WrLstDek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX2aSiO26yMVTm zyp5D6IM/5f/x7X7Ch7OsnPuYX4Xn9jnOiO1JO+qYXj8Tl8iBfBSAAvBBDVJt73Cch5JJQQIfvd 1Ej7ZTlR9ayDUTUuxfmzZeEMGKChvLAay1ZLG9Bj0a7B9XnnKUn3ZeeNn48rt746FZtYOEsZYpi
 /BPHqwkR5B/9dymC9XXFTQMq/jI7RdXPaTUYUJCq//DD1CCs0ilg5ruV8odQRobASqlLHHYfZvd sqK6HGy5C10glSrT/ZKHQA7AJNJkR5/TC5JCbYr8GvHQwFmFbkcp00qjUoUywUl+3IFqyf+zrN9 gNrDDc8l6AFMfB2g4zwcYmyHyPRPXlGbl5DcdLH6MXK+U1LL4Mlw/gXbdy+iWXRbwMkMdzdeg3U
 Oza5fjA67XrOHOqsd08XrEkonEqC6bF6UQIcMkNAa/90DBcHQFMMshnVOPqemE09vhZ+Mg42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001

This class only supports one type of operation:
  - name: BLE_TRANSFER
  - id: 0x01
  - unidirectional
  - payload is:
    - first byte: HCI packet type
    - HCI packet

Implementation is very naive and doesn't keep track of in-flight frames.
The goal of this commit is mostly to open a discussion. What would be
the process to add new bundle and protocol to Greybus? Should Linux be
considered the actual standard (as it already differs in subtle ways
from the official specification)? Or should the (official? [1])
specifications be updated first?

[1] https://github.com/projectara/greybus-spec

Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
 MAINTAINERS                          |   6 +
 drivers/staging/greybus/Kconfig      |   9 ++
 drivers/staging/greybus/Makefile     |   6 +
 drivers/staging/greybus/silabs-ble.c | 203 +++++++++++++++++++++++++++
 4 files changed, 224 insertions(+)
 create mode 100644 drivers/staging/greybus/silabs-ble.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 10385b5344b..ea0923741cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10009,6 +10009,12 @@ F:	drivers/staging/greybus/sdio.c
 F:	drivers/staging/greybus/spi.c
 F:	drivers/staging/greybus/spilib.c
 
+GREYBUS BLUETOOTH DRIVER
+M:	Damien Riégel <damien.riegel@silabs.com>
+R:	Silicon Labs Kernel Team <linux-devel@silabs.com>
+S:	Supported
+F:	drivers/staging/greybus/silabs-ble.c
+
 GREYBUS BEAGLEPLAY DRIVERS
 M:	Ayush Singh <ayushdevel1325@gmail.com>
 L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index 1e745a8d439..3d14eabb196 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -213,4 +213,13 @@ config GREYBUS_ARCHE
 	  To compile this code as a module, chose M here: the module
 	  will be called gb-arche.ko
 
+config GREYBUS_SILABS_BLUETOOTH
+	tristate "Greybus Silabs Bluetooth Class driver"
+	help
+	  Select this option if you have a Silicon Labs device that
+	  supports Bluetooth over Greybus.
+
+	  To compile this code as a module, chose M here: the module
+	  will be called gb-silabs-ble.ko
+
 endif	# GREYBUS
diff --git a/drivers/staging/greybus/Makefile b/drivers/staging/greybus/Makefile
index 7c5e8962233..c61e402595a 100644
--- a/drivers/staging/greybus/Makefile
+++ b/drivers/staging/greybus/Makefile
@@ -71,3 +71,9 @@ obj-$(CONFIG_GREYBUS_USB)		+= gb-usb.o
 gb-arche-y	:= arche-platform.o arche-apb-ctrl.o
 
 obj-$(CONFIG_GREYBUS_ARCHE)	+= gb-arche.o
+
+
+# Greybus vendor driver
+gb-silabs-ble-y := silabs-ble.o
+
+obj-$(CONFIG_GREYBUS_SILABS_BLUETOOTH)	+= gb-silabs-ble.o
diff --git a/drivers/staging/greybus/silabs-ble.c b/drivers/staging/greybus/silabs-ble.c
new file mode 100644
index 00000000000..588e8e067e2
--- /dev/null
+++ b/drivers/staging/greybus/silabs-ble.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for Bluetooth HCI over Greybus.
+ *
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#include <linux/greybus.h>
+#include <linux/skbuff.h>
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#define GREYBUS_VENDOR_SILABS	0xBEEF
+#define GREYBUS_PRODUCT_EFX	0xCAFE
+
+#define GB_BLE_TRANSFER		0x01
+
+struct gb_ble {
+	struct gb_connection *conn;
+	struct hci_dev *hdev;
+	struct sk_buff_head txq;
+};
+
+static int gb_ble_open(struct hci_dev *hdev)
+{
+	struct gb_ble *ble = hci_get_drvdata(hdev);
+
+	skb_queue_head_init(&ble->txq);
+
+	return gb_connection_enable(ble->conn);
+}
+
+static int gb_ble_close(struct hci_dev *hdev)
+{
+	struct gb_ble *ble = hci_get_drvdata(hdev);
+
+	gb_connection_disable(ble->conn);
+
+	return 0;
+}
+
+static void gb_ble_xfer_done(struct gb_operation *operation)
+{
+	struct sk_buff *skb = gb_operation_get_data(operation);
+
+	kfree_skb(skb);
+}
+
+static int gb_ble_send(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct gb_ble *ble = hci_get_drvdata(hdev);
+	int ret;
+
+	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
+
+	ret = gb_operation_unidirectional_async_timeout(ble->conn,
+							gb_ble_xfer_done, skb,
+							GB_BLE_TRANSFER,
+							skb->data, skb->len + 1,
+							GB_OPERATION_TIMEOUT_DEFAULT);
+
+	return -ENOMEM;
+}
+
+static int gb_ble_request_handler(struct gb_operation *operation)
+{
+	struct gb_ble *ble = gb_connection_get_data(operation->connection);
+	struct device *dev = &operation->connection->bundle->dev;
+	struct sk_buff *skb;
+	unsigned int skb_len;
+
+	switch (operation->type) {
+	case GB_BLE_TRANSFER:
+		/* Must be unidirectional as AP is not responding to this request. */
+		if (!gb_operation_is_unidirectional(operation))
+			return -EINVAL;
+
+		if (operation->request->payload_size < 2)
+			return -EINVAL;
+
+		skb_len = operation->request->payload_size - 1;
+		skb = bt_skb_alloc(skb_len, GFP_KERNEL);
+		if (!skb)
+			return -ENOMEM;
+
+		/* Prepare HCI SKB and pass it to upper layer */
+		hci_skb_pkt_type(skb) = ((u8 *)operation->request->payload)[0];
+		memcpy(skb_put(skb, skb_len), &(((u8 *)operation->request->payload)[1]), skb_len);
+		hci_skb_expect(skb) = skb_len;
+
+		hci_recv_frame(ble->hdev, skb);
+
+		break;
+	default:
+		dev_err(dev, "unsupported request: %u\n", operation->type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gb_ble_probe(struct gb_bundle *bundle,
+			const struct greybus_bundle_id *id)
+{
+	struct greybus_descriptor_cport *cport_desc;
+	struct gb_connection *connection;
+	struct gb_ble *ble;
+	int err;
+
+	if (bundle->num_cports != 1)
+		return -ENODEV;
+
+	cport_desc = &bundle->cport_desc[0];
+	if (cport_desc->protocol_id != GREYBUS_PROTOCOL_VENDOR)
+		return -ENODEV;
+
+	ble = kzalloc(sizeof(*ble), GFP_KERNEL);
+	if (!ble) {
+		err = -ENOMEM;
+		goto alloc_ble_fail;
+	}
+
+	greybus_set_drvdata(bundle, ble);
+
+	connection = gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
+					  gb_ble_request_handler);
+	if (IS_ERR(connection)) {
+		err = PTR_ERR(connection);
+		goto connection_create_fail;
+	}
+
+	gb_connection_set_data(connection, ble);
+	ble->conn = connection;
+	ble->hdev = hci_alloc_dev();
+	if (!ble->hdev) {
+		err = -ENOMEM;
+		goto alloc_hdev_fail;
+	}
+
+	hci_set_drvdata(ble->hdev, ble);
+	ble->hdev->open = gb_ble_open;
+	ble->hdev->close = gb_ble_close;
+	ble->hdev->send = gb_ble_send;
+
+	err = hci_register_dev(ble->hdev);
+	if (err)
+		goto register_hdev_fail;
+
+	return 0;
+
+register_hdev_fail:
+	hci_free_dev(ble->hdev);
+alloc_hdev_fail:
+	gb_connection_destroy(connection);
+connection_create_fail:
+	kfree(ble);
+alloc_ble_fail:
+	return err;
+}
+
+static void gb_ble_disconnect(struct gb_bundle *bundle)
+{
+	struct gb_ble *ble = greybus_get_drvdata(bundle);
+
+	hci_unregister_dev(ble->hdev);
+	hci_free_dev(ble->hdev);
+
+	/*
+	 * The connection should be disabled by now as unregistering the HCI device
+	 * calls its close callback, so it should be safe to destroy the connection.
+	 */
+	gb_connection_destroy(ble->conn);
+
+	kfree(ble);
+}
+
+static const struct greybus_bundle_id gb_silabs_ble_id_table[] = {
+	{ GREYBUS_DEVICE(GREYBUS_VENDOR_SILABS, GREYBUS_PRODUCT_EFX, 1) },
+	{ }
+};
+MODULE_DEVICE_TABLE(greybus, gb_silabs_ble_id_table);
+
+static struct greybus_driver gb_silabs_ble_driver = {
+	.name		= "silabs-ble",
+	.probe		= gb_ble_probe,
+	.disconnect	= gb_ble_disconnect,
+	.id_table	= gb_silabs_ble_id_table,
+};
+
+static int silabs_ble_init(void)
+{
+	return greybus_register(&gb_silabs_ble_driver);
+}
+module_init(silabs_ble_init);
+
+static void __exit silabs_ble_exit(void)
+{
+	greybus_deregister(&gb_silabs_ble_driver);
+}
+module_exit(silabs_ble_exit);
+
+MODULE_DESCRIPTION("Bluetooth Driver for Silicon Labs EFx devices over Greybus");
+MODULE_LICENSE("GPL");
-- 
2.49.0

