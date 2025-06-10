Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0083013C8F3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570074; cv=fail; b=E6Oe1XNd0G45dHIuImcNp5/sdrdfN3Y4/sOmsR5Oq23BPjzOplfZ3UfUQxssC13kl9eCGB45jw0KMzf6fhge9ljef3YMQpmxPMPLcMXdsC+5KGLqMl5kZmxUagg2eLvM2CMvzAeN6Bg3eSoUgSw2cRYTrC4sijWcvW/VRPFXUrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570074; c=relaxed/simple;
	bh=pO/9p44w5BLwzOivTOnpo9XfSifnv3XXf23q6iKzZE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lM+bMHu2HV9vevJTTHLUoQM8+18wnwK07PZttrdTh36HEz8jMzQbyZGP33PidOaTZhDvDAvPgRoHh53M9sVBhW2Z+3PfsqERCaif+qpmwLgY5eY12NKhECbgRep0SyNre+bhZb2MdgyRqqk9v+aUXMZtU8jYfj8LlzXsL+m3bZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i9wj1I3l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IlBmczWZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i9wj1I3l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IlBmczWZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AEXbKo030408;
	Tue, 10 Jun 2025 15:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pO/9p44w5BLwzOivTOnpo9XfSifnv3XXf23q6iKzZE4=; b=
	i9wj1I3l0HxD0T6tPy+Bb9pPzNafEK1mPUaQlWkP8sgaA0xkQLha89cViEkFHdKk
	F4r5od+gLvSsfET9nGiEmD8AHVEMAOy5xqUDMyNhiSqZAB5d+tzBdd893m8mbOaT
	XazuEd1YJb2BjleXasGnSXFRWHqVq1T2eslRy7qwB5kyuSiNruoNVmkFSu3DUa/g
	PMw/shpu0+ERB2v4Hony6arWpUdpMwWd6/+C59BgpHINoz/2KWNn/4eLhMqD7PzY
	egnrFgEVJXPZkQaj6ySWX136vx73sge/X5gt5+hJNd8zKHQWtHE8OHR2muykRSZK
	GthGG+dqvxoRsCXhOWLdwg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14cgvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 15:40:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AF0XvZ003202;
	Tue, 10 Jun 2025 15:40:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8wb2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 15:40:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKfSfVMVkciKabMGpEIPJJH8nxqf/K1ot16lpivWJR5DWM/baiib0/m89HnsF/8oTcfY7tc/h/QoLsSfyeNZLmyzyxwfd3NRzVJJFLFavzW2j5AG/kngN40gysOk4ki+S/EUl1iM0SBaFges7mSR3VaSLkqaEeyod60o2YjDx93xVIVbb3ggBVdCs12pUObdnVWQhLx1BB+QVNAGmsrXzWC4oS0o1jMEwohmfEtWe3QZxpXlY063lGujV8ov80U4uDxeJIBdKcZt9LNxenbF9KAZVVYqxnnO8BAZUs1AH5sAHKb94Xc9bN/B8DaAhnx/sccngIyn97IDqRGOV3itYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO/9p44w5BLwzOivTOnpo9XfSifnv3XXf23q6iKzZE4=;
 b=W5KWjmHbPMRm0WBzh5T+gBurRPOxyK7fTViQ7gy0s5wR1QS4uzjdBf+x4qLZidh1JXBWke/eCMKybOGgiaGkLEhGhjCBMJCaElypo89azqxUby/EsrRsxbPXvQl9Qtt86r5c+WQGtSYnCjaNOe4Q7BXRbrOSda2ApRfavu4GoPiWQxHpXKGn/2p2YqN8JHoV9mL/mgP5dqGulY1l/p0HQdn4i6261paU0ZlPpAOYFZ34T8vtHF4hCGBGc9DXjdm1ZXF/s1G8HvwIzCxnvpacmISu+Fj+BwzZtH64y53HMPVqjOZ8h2WgiWkoF4NKMVxKQUbpEll3RRlNNCYyCVdBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO/9p44w5BLwzOivTOnpo9XfSifnv3XXf23q6iKzZE4=;
 b=IlBmczWZLl51CfjAR+C0Dqy3vwZdoP4xwxyEK2+bFBxjSEZfnlggMiu/+8YoZc/Oo5NnzCGYbpazz3zj3NLSUNqDCQvhBlWDpUGZhacGwmv4vLb1+Vz1wqB5n71qFuSsNjm7IR4xYH1mvSdJNfp7L+v66IHNl5VfgeSchl43TIc=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by DS7PR10MB5999.namprd10.prod.outlook.com (2603:10b6:8:9d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 15:40:09 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:40:09 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>,
        "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Index:
 AQHb1V0mtwlUIwQHSki21OTBoge6R7PzFm+AgAArT4CAAB/SgIAH9WMAgAAQA4CAASoogA==
Date: Tue, 10 Jun 2025 15:40:09 +0000
Message-ID: <F2AEFF3B-15E4-489A-AA4C-0F829BBF32A5@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
 <20250604145433.KCPMF8zm@linutronix.de>
 <80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
 <20250604192327.sVjt6c4u@linutronix.de>
 <20250609165532.3265e142@gandalf.local.home>
 <20250609175251.1fc90ca5@gandalf.local.home>
In-Reply-To: <20250609175251.1fc90ca5@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|DS7PR10MB5999:EE_
x-ms-office365-filtering-correlation-id: e317f9af-8415-450c-837b-08dda8351503
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnI1WksvcmdTalhuRGpQQmZpYWVJWmJGQnVBbGtOM2hyaUI4M3pqWFZNWi85?=
 =?utf-8?B?NXVSWTJjdnR6SDhpRnRMVFRCZGc1WTVmVVhHbkoySGd0QS80Y3MrczRETW5Z?=
 =?utf-8?B?YmlCdzg4WmRHblQwRnVCWDFWUERQOWtwRlF4Y0xZZTZYQmR5Nnk3YzlHK0pm?=
 =?utf-8?B?Z0RYWVR5ckloSEsrUmJOUnlOcXY4L3d6eUdNcVZadlpSeHBMSWtNRVpoWjZ2?=
 =?utf-8?B?cWJQUERrL1V1SmJBV21HbDNWQ1Y4V0JlUDRNNWJMeWlOMi85NnV0Y3RUcmxP?=
 =?utf-8?B?UFJGcnpBL0lsK2NVL0RKaDR1dTd2SGtNOENzRXBGMG9WYmltU3F0M29rb1pm?=
 =?utf-8?B?aGE2aUo1S1BBa3dUM1ZkK0FXWFdjNllMWDhFUFRDbXQ5SDRXTjNiOVI4bzRh?=
 =?utf-8?B?dFVndlkvSDE1bFE1VkNYTVVvbGltVVFad3JxK3lhL0dHTnlJYm1KL21RS3pj?=
 =?utf-8?B?ZUZwbzNTQy9EczU5SHVoVW1XNmZzK01YNVJzdFY2dU5OemowdUQ2QkpVajJN?=
 =?utf-8?B?Z2lpSXdtV0dGTlU4MTRaRHFJZDBnQTdRUml2SmVWaFhxYjZ6ZDAvcUkrU2tr?=
 =?utf-8?B?Q29IZHBPQlZ0UUJVdnpTcnlWdGxETWdqbXpNWEg3ejJQL1h1WUJLY2xOWHVC?=
 =?utf-8?B?VnlQN0ZpYkxlbFpPbUMzNThoQ1l3ZjIxeTRURlBBMjVPV3hmU0ptYmcvT1RJ?=
 =?utf-8?B?NE5HUVhKZ3o4NkdhTmNuMkVxWFhtRit1VDBJME1aMmpBRXlHN1REWmQvQWdW?=
 =?utf-8?B?cXhmekFaUldVVmxTRFNjRjVmMnByTnBHZzBNRTFyZ3lzZmlzRFY3djI4NDNz?=
 =?utf-8?B?Yy85VFR3RTJXY3ZVWXhVN29pdSttZDlkUVNRT051c3BJMzY0dXNxbjlWbHZT?=
 =?utf-8?B?WHJtRUpseXJjdzdNUW84OWJ0Y0FkdmQvdHBGYjZBYlJ4b3dBcWFKRkt0Nnp0?=
 =?utf-8?B?NXlvWWVnLzQxQmhkKzFBeVJueGMydzYrZStTa3MxTUdlYWNSR0xQaytpN0RW?=
 =?utf-8?B?bjJzU1pVSlU4a2NSQWdBcGVtR0t6ZFhReTlHQnhHZ1ppS3dwd1NSZkkzcVhM?=
 =?utf-8?B?TmF5dEZ1Ni9SRjNLaWpPdm5RdnFySFhKUDRnQUNLYnhMWmNyano5ek80STJW?=
 =?utf-8?B?SEthTEx5OGd5SGxGcDFOeXFuY1dUOXZLY3RJQjlrUTJMRDRaUmVPa1ZoVXF4?=
 =?utf-8?B?VFVDTGJ0cDFsWGQ2eEsyT0xQRW9PSC9QRzJjaklvUUJSODF5R1RFUmNHZ2l1?=
 =?utf-8?B?M1FYWkliY1lScXFWcWpDZTZNanp4czR5cVN6dW9FVnpDdkxpLzZSZUluQUY3?=
 =?utf-8?B?eDhsK1JoNUc4VVFmVUc2dHlZaE53UTJXdlN5SnZOZDg5TnRmM2Q2Uk5yREdF?=
 =?utf-8?B?ckJuSXlPczkxM2VtZDZ2K3g0dEQ1L0NoTUZ5RDltRGR3QTJaMG1OVGhlY3Uv?=
 =?utf-8?B?dVN0V0R3NDBlSXpCeXN2bEZqUnAvSysvNFZtRDNONzByQ2hFQVphRWUzRExH?=
 =?utf-8?B?N2t6MFlBZHNEMHJxUUFwMUc2YlREdkN3aUh6QWpjdGVFMndXRVllTy9hZEpl?=
 =?utf-8?B?NVVBRWQ5NXhpU0FvQW1salExRXRlbTk4Y2tyUEVhZVFhWGxDSG41cWlaam9s?=
 =?utf-8?B?eVo2YmdHRUFMclVSTy83OURuVEpIWjIwZHhoUlFzczNVak9XSWFNRlB3QWk1?=
 =?utf-8?B?OVJIZzhCbCtHVXBTT3cwa2ZNWVE4cGg0SjFKMzRTRlZheVlGVEFTVFIwZDFX?=
 =?utf-8?B?WWhCOTU3Z0Y5dy8vcHJwdW1rM0ZXK29YbkFHczZBRGQ3cTdYZE42d2MxcnFV?=
 =?utf-8?B?aDQ4LzNiQ3hXYmxlcU1OUzUvSzZvZytSY2ZxRk5FYlhDV0N4Ukl1Tm5WRm9Z?=
 =?utf-8?B?R3RSTGRYNWM2bHNZVkhTZFJVcU0zNC9WNjc1dm5KNGJvbk1QUy9OU1NDMlNu?=
 =?utf-8?B?RWJnNG51b0JSWE8yK0o3dmg0VWhSa3dqME9IWFpZRHVwMSs2SnBYbHFPRXB0?=
 =?utf-8?Q?LgUpHIMr0tDDlMHaZEqaN3D6w4+1/4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXZ3L0JyK1ZVZVpCY2pPYnM0cTQzWm42MVQybGpMRFdxTU5hMkh2eklNQjA5?=
 =?utf-8?B?WTE4VzUyODFqL2NCOU1tVWcrS1BHYzA3K0ZiTkRwZTQ3WWJoRWtmMUVROXVp?=
 =?utf-8?B?R1kzN3B6ckJkU2xxZXlDTXc0Z1dHY095ZTZDZm92bHAxTVBYT3A5K295alRF?=
 =?utf-8?B?ZEZrRlI5RjB2SkQvSzVCUW94Z1N4UHh0aEpTQU42dUN2SGQ0TnY0S1NiNDF6?=
 =?utf-8?B?RXhpOFhmNk5BbXNUdlhWY3hQQjJPZ20yaG1GUXNGZXc2MUEyS1ozNG9xaDBu?=
 =?utf-8?B?ZXc5RGRScFRFbTB6bFF5RWlVS0ZXVTZaWmJwdTdlS3YwSnNaY0thZmMyZlY1?=
 =?utf-8?B?SHl4NURFTXR6dXU1M1VsVVIvRzZlbU1RRG9XUHh5cWJhRkpNU080c3BZRkh2?=
 =?utf-8?B?SlNzamRBcmhtajNtQjRGQm9aZ1NxVlhFOEY1QTVwNlY3Q0JjcVUrc0x0em5n?=
 =?utf-8?B?UlppZkZDbXptWTlIUWttZDExV0s2NVNUWHVFejlwYVQyQm54M1ZoejlUS3o5?=
 =?utf-8?B?d2lWT2ZaSmNBdWF1Q0RUNnB1NUExT3FEQWJVY1J6dVR3MmdiR093VXArdFVx?=
 =?utf-8?B?K01SRVVEQ2N6SktoUi9FOVMrQW94R2JRMDlPNTdselhlU3RJSmoxdFp1YzFJ?=
 =?utf-8?B?NUlMMUtCWXVoVEtJWlp6dDMwVlBhUXlwemUrVzJFS0hlYjdEaTZQR1EvdE0y?=
 =?utf-8?B?VGN2YUtVZTVBeHFMQitzNFVUcll4amIrcldsb0t4M0dMSnlzMkdTRE9UU0hz?=
 =?utf-8?B?K2FuTmZnRStGcGdaa2x0RGdHNERJZ2lCcC9xNjlPWWxCc2ZJSnFMUU5wNnkv?=
 =?utf-8?B?aEpjblhkUUtCSm5uRDhvU2VFNjlJZjE5VFgyZkxaaXA0ZkxyQ2VKb0hQdkRk?=
 =?utf-8?B?NkorZ1BvUEFJUVVoNmxreFNjdlZ6RjIxRTRYcjdsS05jMzY3andqeXBUTmxv?=
 =?utf-8?B?RGRwOWczVm1xWHRaTFJDNmtVZW5qdUluY1ZTL2Nsczl6MVJTY09jV0xTU1Fk?=
 =?utf-8?B?TFpMa0FxVGNSSnNvUHgxNmFNK2FRTWQ5Zmw1dXlZeWRrT1FYbVlZcDJsbUho?=
 =?utf-8?B?c2NBbWhiNkVjdzBSaWZlK0VxSi9vMFR6WkxvLzMvRXJmNEdDbkk5QmF0ZnJQ?=
 =?utf-8?B?Qlhja0FqMEpnMUdrR3hvK2VrN2VoQ00rUm5pWUw0QWdFWmt4UktMOElORE9V?=
 =?utf-8?B?NjJDWVlYNUJRbitjaWJjQmxPcVhnc3Y5YUtWeWtCQStpbXhiU214Vm1PVDdO?=
 =?utf-8?B?SEkxd1M1cnVaY2JMR2paVWQvRmRvOVloN3B1U3dmd3MrL2luUkVIUHIySkJp?=
 =?utf-8?B?Y0NKZi8zWVloeEZFMmlCeHcvdzFyT3ZZYklpY3NvQjhPamF3RkpRZzZscmpT?=
 =?utf-8?B?d3ZSRFptd1ZML2NzR0Y4VjZaZnJzaCtJNmZUVjJaUUhYdXRvb1h2aDFUempr?=
 =?utf-8?B?VE1jaG95MHhDVXd4UTFWRk5vQ3VEM3BmcStYKzhEUEZ1S1hJMWtNTm5CRWJF?=
 =?utf-8?B?NWhoamQxZVY0bG5hcWxrVnZ6VVFWbFVqbGlqYkFEeGQ4VzNsL2hDR01IN05W?=
 =?utf-8?B?UW13Q1lmT1MrUlRsc2RuVFBFaVo5T3RmK243MXgrQ2JHTnFNREpyaWsxNlp1?=
 =?utf-8?B?bUtlc2RqQzhWUmp4OS9NM2Z5dUFpNUhhV0pmTEFqSVNhUHVVejc1NFl2NVBq?=
 =?utf-8?B?Z21NeHU4WnBESnBnOVZGVEtCdklaYlIrNEUvM0VKVjVVVjFJbmpZb1Bxei92?=
 =?utf-8?B?Tng3UUluSVJISFl3UWp5Qnd3eGlWait6NG1Hc0laV3BpV0tGLzRSYXFKWkhv?=
 =?utf-8?B?clVYaVBTRjVFdWM5TGtXRmErUWprRERScE84c0gvZmI0cEpWVVduQzN2Z3NU?=
 =?utf-8?B?ZFZZNENPcVBOMkpHNWhmWFd6UWJYdVk0VzZ3RXVaRzNJZlh6dTJJTW16T3Vk?=
 =?utf-8?B?c25KVWY2SHJhM2haUzJaUWtUVjF6STVodGxBT3BrS1hKZjJlK3dodWdYdmw5?=
 =?utf-8?B?dnFkZDV6akpkWEVJbzlvZ1V1QmIvS2lBNFRXTFdpaldjbHR4UFlxZmdDMkNP?=
 =?utf-8?B?RHd1N2Z4cmdwdzRwVzZyUkxnRzYwSVk3WTc4eUZ6WWt5TTgwRTU5R2wwOEpm?=
 =?utf-8?B?QWhLNmFZdnFlZ3ZrZlFpUk9NV0xrZVlzeklTeEpzM3IxZnNLak5lTVNPSXhU?=
 =?utf-8?Q?RS6yabhx/1feCyNgbwU43fA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F86C2C86BCC1942BB6E4AA326258782@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qGyd2N1gVMRgi4v2u+RJ0X/hMb+lZocLiKtrL4AChZCjYt/Sb19yLno3FJqoOljZpaKWuZzuQ8p1/c4FOIqWtIIxdddPQudvcUwirZZun/Dx+udRHqv04RAGk2T844laalMxBfdwNLM0tSduRFsIYPQf1PI1Gn0p7haD3jaqK/JVClrNzg1CQaU4nkcKCfWTfVEdd6WEIDoRu4TTrsFNdAnReY3PaxfzFY0kSUem5Jj3k0iiaLIl417y2qDmhBr53g6LmBPBPxvXP9rxjRhnU5JMt81JNd8M1lY65uea8XuMvlhRZfkroaXleIrb0oHlwrU+s2pHSEhsSs/6gK3plSkEaFam6CZGDs9ZyX/5Zu3QVCVIl5y9jhrSV/MVjFk1+pxOEHTIdz8VkizHGhVIu9sdHL9Rj3wOIOTXLkduKtc47B7cDMbgs+5sJxKbQqw4SdPGXK/4s9tGgRQ2bZ6uvE5mGf88zdWZnXEN0KKgSB+jlJv8C9b1ohuAkIWi/on9utLTK8efwL9e/4jMn02mJTn/0CKPbOdvg4+3yCKRRdKPDwsvlr5PRFcIZ2V3tbA5MEOAwScSwdt+XVy0aF8VFXu8sDxuaxUTx129oC2INb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e317f9af-8415-450c-837b-08dda8351503
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 15:40:09.5564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yl+rPYXXBmw6Al2X6QaCRFNPre10k0gWoSS68xfenaVsT85ag6MzvshhNhxgrIjdphTd6YGFGTk9xA9OG3mRt6CdY5xsOLcnFYFM7f+iSsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5999
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100125
X-Proofpoint-GUID: V8KBV8MvZNuSaZnyLtmlbzBmBSAwuy_i
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=684851de b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=VAn1KByW3G7uEDkKOWYA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEyNiBTYWx0ZWRfX7XFJcLfzxcuV LK/MQwbuaJS0kEqeVbk55E3/eQdWLebezgwg9FzYINrryVN+PfWIgnbZ6c9P+uF+iZStFp7Yl8q bYhC/iap8hOW5CpjZlLC+QLk9014rXYsitiQBjzsNesKJfup5vJElnDkHbNXR2YAK2lXCgEeYqf
 W6ZUrj1RUYDRI7Vjzegw0BGkIRy+b1Yolg9E1BtlM0lRQLcoVViCEOuCyS6iyGVGZON7FoEb7pM 4CCdwDbQRMsD/KFwFfuMv2LmQdps7eGyDkejemD85FCP5Nmj5X0ZiJiT+xiC3rzq+cWr4nK/HF3 3nm9VZRPX+IUPtwqML1AuBIelUDxKUkMmII2JZ2vzkS8Sm8W2IYJ7z+v4yhjCKdzgsxjWhYNXtZ
 9VRgIQUbrzCrVXBnrMn7hoNqBlFj4YLlewksBLqiViQalQlkHo2UMMZwaK+iwNknByOqGgSN
X-Proofpoint-ORIG-GUID: V8KBV8MvZNuSaZnyLtmlbzBmBSAwuy_i

DQoNCj4gT24gSnVuIDksIDIwMjUsIGF0IDI6NTLigK9QTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCA5IEp1biAyMDI1IDE2OjU1OjMy
IC0wNDAwDQo+IFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2RtaXMub3JnPiB3cm90ZToNCj4g
DQo+PiBTbyBJIGFwcGxpZWQgeW91ciBwYXRjaGVzIGFuZCBmaXhlZCB1cCBteSAiZXh0ZW5kLXNj
aGVkLmMiIHByb2dyYW0gdG8gdXNlDQo+PiB5b3VyIG1ldGhvZC4gSSBib290ZWQgb24gYmFyZS1t
ZXRhbCBQUkVFTVBUX1JUIGFuZCByYW46DQo+IA0KPiBJbiBjYXNlIGFueW9uZSBlbHNlIHdhbnRz
IHRvIHBsYXksIEknbSBhdHRhY2hpbmcgdGhlIHNvdXJjZSBvZiBleHRlbmQtc2NoZWQuYw0KPiAN
Cj4gSSByYW4gaXQgd2l0aDogc2xlZXAgNTsgLi9leHRlbmQtc2NoZWQNCj4gDQo+IFRoZW4gc3dp
dGNoZWQgb3ZlciB0byBjeWNsaWMgdGVzdCwgY291bnRlZCB0byBmaXZlIGFuZCBpdCB3YXMgcHJl
dHR5DQo+IG5vdGljZWFibGUgd2hlbiBpdCB0cmlnZ2VyZWQuDQo+IA0KPiBUbyBidWlsZCwgc2lt
cGx5IGRvOg0KPiANCj4gICQgY2QgbGludXguZ2l0DQo+ICAkIG1rZGlyIC90bXAvZXh0ZW5kDQo+
ICAkIGNwIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNlcS1hYmkuaCAvdG1wL2V4dGVu
ZA0KPiAgJCBjZCAvdG1wL2V4dGVuZA0KPiANCj4gIFsgZG93bmxvYWQgZXh0ZW5kLXNjaGVkLmMg
aGVyZSBdDQo+IA0KPiAgJCBnY2MgZXh0ZW5kLXNjaGVkLmMgLW8gZXh0ZW5kLXNjaGVkDQo+IA0K
PiANCj4gLS0gU3RldmUNCj4gPGV4dGVuZC1zY2hlZC5jPg0KDQpUaGFua3MgZm9yIHNoYXJpbmcg
dGhlIHRlc3QgcHJvZ3JhbS4NCg0KSW4gdGVzdCBwcm9ncmFtLCB1bmV4dGVuZCgpIHNob3VsZCBi
ZSBzbGlnaHRseSBtb2RpZmllZCBhcyBmb2xsb3dzLg0KDQoxMDFjMTAxDQo8IAlpZiAoIShmbGFn
cyAmICgxIDw8IDQpKSkNCi0tLQ0KPiAJaWYgKGZsYWdzICYgKDEgPDwgMykpDQoxMDMsMTA2YzEw
MywxMDcNCjwgDQo8IAl0cmFjZWZzX3ByaW50ZihOVUxMLCAiWWllbGQhXG4iKTsNCjwgCXNjaGVk
X3lpZWxkKCk7DQo8IAkJcmV0dXJuIDE7DQotLS0NCj4gCWlmICghKGZsYWdzICYgKDEgPDwgNCkp
KSB7DQo+IAkJdHJhY2Vmc19wcmludGYoTlVMTCwgIllpZWxkIVxuIik7DQo+IAkJc2NoZWRfeWll
bGQoKTsNCj4gCX0NCj4gCXJldHVybiAxOw0KDQo=
