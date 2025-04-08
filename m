Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833E288D2;
	Tue,  8 Apr 2025 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136042; cv=fail; b=Jkx/XsNoEYwgEM8w//tInZN5yNzfFIN64XNaCIW2TFoXjezi0TUgDfqmCTwGuuQeBMG4gtKotaWp6/W4PipUm0xnG0LyFzC4Jvl+eMw+5PZAM7U+4BcxlDmtQ9PAXzP1t2O/pJyS0cUc9kuOnGgHJ+L5kEfAjOa7xEYLemnRsv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136042; c=relaxed/simple;
	bh=PvftmX5diYvVsx/aIbX7wnvkUelfpkM+tBMS2dHGArI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sllo8P9f497V+7dYbNnk7Q+h2AF4UqVl3p0TJkbC2JmQ9RGjdNuE8BJj0tsD4fzmIeKD2yaOr3lPaE+Q/dzoCzTJ58g4SZjHZJUEzT92v7ggzuezkEkenazuxhQE524x2QOeY7qN/jygcF5VvUnsgIjj9UoLeAlN7ENz2uvtSeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=e1RT3Hhw; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="e1RT3Hhw"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Gsx9i013247;
	Tue, 8 Apr 2025 17:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=PvftmX5
	diYvVsx/aIbX7wnvkUelfpkM+tBMS2dHGArI=; b=e1RT3HhwAGHdmgA82KvbGMN
	maShhpwj4eYxXEJYfPGqhtkDI6zuTTlbGUQUY7i4bRtLzNNp81HNOkC53Gt7gAm4
	FOYB5g0m2RhksnXI0wPRSf8eo4CQxdoHfmHWQ4fFX0s1V6S/lP9PCSV8f2br7RL5
	jvyZvfJN+WFPoKMCXjnR2Pu0jyHVps4oE29q7iUPl1w1i1FKG/vndyiugBVJOncP
	qLJMpESkP9I0JbM0N/nWV6fA9I6Ck3suTIDqKC8rg3yPUZnIlt55YGJt7OvX8Jk/
	dCmjvdwG5oTwb2sNbVmZJV2FkqgkCcD+0ObVUuVvN6iTWcv+D0BVa4dQvQAoTaQ=
	=
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 45ttdjjsj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 17:34:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9Dre6cZS+ybKnBhkkQX59WO5ugV84ZdTFhU2XC7ipC9OMzHWqFIUilrDlRL+MCRShFmZKjcrtiMFPEOVFwkIWMu6eN6XtV0kI/6HPELeOcZcBhjmhwqxZUwrnUM+GRtyv692a6lbLBfsCWE3wnJJzuYO8UkGVyGrmHim1Irmw7yJVINKvp5pL2od+EtMOIfxm6b6kEIHSN1SN0BQRaRloG3H6rfUyJKAfwAJzpDhZ5XBwMeklKRgcxP7rTZvqAurF7kLxXSZGl4eezBq52JoILDEgC0iuvLwbBlAmyY4YeUKnS/pXY6aWV1D1jDcXKricYYfv8QqBhEVsOjHVgC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvftmX5diYvVsx/aIbX7wnvkUelfpkM+tBMS2dHGArI=;
 b=v+r0Y6comCCL6bElH3l41tbX/fv2oVHXc6+BlFW9FDbhTPNZtnSUaF3x+/WyFFLc3swBbG5Dgg8eigs2uAY3ppFHdn2rAmp2qC3KQzCWbtQ6fdzWhfaRD2tH9Hx0RIww0Awap+tlgOUroypu3N1571vIfOGC1hx9AGMpSNsejOVU5i7flEt/FizdnWNfcZa+BdTsQ+1MJbOw6M3daiucOWAHRUb3Aca4rBDKMvBjLe07j2SAZdscPZarT4zV9PevP6eToVz/N86vpxzxmqlBw/RjnMqpp7RME/jDrkp57779OgcQw+adLg9qLW4VHJ+H5LL0Bytp/b3fe+rpEGVnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA3PR13MB6490.namprd13.prod.outlook.com (2603:10b6:806:380::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 17:34:20 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 17:34:20 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Gon Solo <gonsolo@gmail.com>,
        =?utf-8?B?RHVqZSBNaWhhbm92acSH?=
	<duje.mihanovic@skole.hr>
CC: Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: spdxcheck: python git module considered harmful (was RE: [PATCH]
 scripts/spdxcheck: Limit the scope of git.Repo)
Thread-Topic: spdxcheck: python git module considered harmful (was RE: [PATCH]
 scripts/spdxcheck: Limit the scope of git.Repo)
Thread-Index: AQHbqKx1GDhWhmCw5EOcmzyPeer6Cw==
Date: Tue, 8 Apr 2025 17:34:20 +0000
Message-ID:
 <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator> <Z_Tgp8L_8goc63K1@pampelmuse>
 <Z_TtXaRnaU1zXbXv@pampelmuse> <Z_T8OiLQzKDGhOJs@pampelmuse>
In-Reply-To: <Z_T8OiLQzKDGhOJs@pampelmuse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA3PR13MB6490:EE_
x-ms-office365-filtering-correlation-id: 48e97942-ecca-4a2a-7d29-08dd76c39843
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U3VvVzhIcm02YlBKWjJtbFlOdXFTWGFsbG5TbGVXQVpIVldtMGt4Y0g0K0wx?=
 =?utf-8?B?a1FoK0F4bUhyVm50UW5Db0IxQ1g4NWpyQXZrYnl1UmpwZmYrQkdlSTJqbXRF?=
 =?utf-8?B?c1FtTXZVQi8vYng3a3dyWldwSUcvcWxIQ3pqUGVSMThMc0ZGU2dtcCtEQ2dq?=
 =?utf-8?B?T2pyMzBRSnZTQkxpODlaem9yWlJwa0Y0OStSeCtsSDNGZkN6U2dLR0o1MXln?=
 =?utf-8?B?UUZrOEFzaXhzSWNBbDBEMVFjcWJ4UFBxWlVRUG9IZ3hQWi9penBsVXBEb3ps?=
 =?utf-8?B?OWJ4UlFySUoyL3BDUUpCVmhDdklXRk9OZThHMFY0dzRBOGl2bjMvdlM1Tk55?=
 =?utf-8?B?cUJnNVNrWmFRNHFyT1JqK0dWRWlYa2ZsT3ZKdEdFRmFabXpKQkJFOFZtK09p?=
 =?utf-8?B?YUt4dWZsTzF3NGppUU1aa1ppRkJEMnZ5b2FvSTVXdkpmaDhpc3owSU0wVEZB?=
 =?utf-8?B?Vlh0cDNMcWFrV2hDZ3c0RFR3UTZaakJsblNIR2xlanhnTXo4NHdjQ2QzM2ZQ?=
 =?utf-8?B?UTZkNXhXVU1MN0FSU3kzSGk4NllEM3ByRUhpbzVGWS9JejFCTFNLRnZtd0VJ?=
 =?utf-8?B?dFlBMmlnVWJ1Umk2T1QvalNuTGVCcHZlOGJYYzZ5Zng0eDVDalBrSTlKSTNJ?=
 =?utf-8?B?NDZ0MTh4ZS9PNFBDN3pLT2pTNVBYOXdFZ3FUaC92UlorS0t4MnFtbHU3QlVx?=
 =?utf-8?B?Rmt1dVhXam5td1lkYmxuYUZKRWJaMEVmdWMwS3RHLzFZVVlFU0VhbjcwQk5M?=
 =?utf-8?B?QVBwT2dvV0Ezb1hISWZqV0FHYmlBTXRhZVVTY0JYS2FHbHJ1V3E5ZFVWOHVQ?=
 =?utf-8?B?Z0JVWDBEQmd2TXNHWXE5YkJUZkMzeVhJdUt4SWZHeHc4UzhTVmQzbHJIWmdW?=
 =?utf-8?B?Vysxc25aR1JWY1VhaUJqOEFpNzYyNElpV25oQ05BcjhpbFY1MldhdGVLVEVP?=
 =?utf-8?B?b09KS1p1YXpZRkNaVkZnV3lWZWxzVXp5Qm9aSFRXMkR6a1J0MVB4ZU52Nm9u?=
 =?utf-8?B?MGtHa1p6dkdmWkVaL1c3ZUhEQkphVzF5cWp4NzBXVjEraDhOek43ODB5eUx0?=
 =?utf-8?B?bXFjMDY0d040VDlnN2RFUG1tZjVsK3MzUmNXYm1zZk1mM3NnMmwrNWFQdjF5?=
 =?utf-8?B?NEJWWHZHVnJvUVpSdUtuNFc5QU04WGcxSHg5SERKWlp5UWNaTjlyZTl6L1A4?=
 =?utf-8?B?VVpGbDNHRHFIWm5mS0pFTFBvc00rUzFFZU8yWFlvVjFLckhCckhMKzJScTJ3?=
 =?utf-8?B?ZUdLbWMrdDlaZWpnNGhOdmdQa2FWK0pXdWNEVmNrbk1Qa25rT2phWkh2K2Ra?=
 =?utf-8?B?RHRxYjJScTVoZUV1b1NYMDZHbzhpa0Izd04zWW8rTDI4c3N4VU5FQzRYUERV?=
 =?utf-8?B?aUJqaHhUVXo2UkVFNmpoRnJLSVRITWkrcFIrcDFZWGt5bTZDYmhVWTNQbUJU?=
 =?utf-8?B?RXNEV1p5S2I5Qk16SEhoWXlJWTFvcHZ2REVLQ0FGS1p3blcxeDB1Z3Nxd3Mr?=
 =?utf-8?B?N1JBNG52VTA2Uko4NSszQThUdGhuOS9sRHNtcnRrSWVIU2NKNGYxV0c2VzRp?=
 =?utf-8?B?YkdoZnUwY3kzVDVUVm1IRzQ5OFB4R1picWVFRk54bVNpVEtLUGw3ZGJyQUJ4?=
 =?utf-8?B?NG5KTHJ1Z3hCaWNMODFSOEJxV3BQVmN2VFF0SnAvM2ZFK0JKOW1uMDNSdjhx?=
 =?utf-8?B?eTJpZVk4NFBpSVk4MCtQV1BrWW1kSEU5ZjB1VjlpN2txdm5zNGVvbTg0aGdK?=
 =?utf-8?B?Vm1XWERpN21Vek10d0ptZ1lsQXl5SGtsUlh0V0V5d1g0aHExRDR6dkg4WXJE?=
 =?utf-8?B?Sk5SazV1ZkIvTnFYNFlzdWRwanRhMi9PTkFOeGE2SEJhYU93VmFmSU9Leklh?=
 =?utf-8?B?a3Q1V1BBb1ZUeHlMYkNXREg0Mi9rdFVzMFJFUk9GWHY5Zmh4cjJ2ZmZtRFR3?=
 =?utf-8?Q?8U13gXneEiUQgW+XEGnn3IRbHfxNoZJa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzNtMWhqcWdQaDB2K3p0UlprZnJEcUFNWGlsbUJLdkJiT0xBY2F3L09OR2E4?=
 =?utf-8?B?NDBzT3dCNXVHek8rM1BRQ1loaVpxY0d3T3BUaTlPZW9iSzB2LytVN0xpNGVq?=
 =?utf-8?B?WWo0R1NjWHNWQmdsQThnSUFtV0tSRFZDbkNsMWIyb2FUSCtVZ3l0RXR5cEFJ?=
 =?utf-8?B?Ym1Sb3lHTTd6QXJVSXBXT0Y1WENVUFhSelFpS0JLK1ppR0NIQXM4bkNhQ2RL?=
 =?utf-8?B?YlFxemw0ZzJLNm5hbW9zaDgxRC9BS1hTY25FM2RGMmlkRWp1T0M4VmdzcExi?=
 =?utf-8?B?Ky9KbnFDalFoU2UzQmMwNktoRWVSRjlLZFBRalpRa3FUSE1PMVg2UXhXK1FI?=
 =?utf-8?B?NjNmc0tSeEgwaG9jNUswT2pKSEJSVmtVUTNpMzk5WlEwczVOVlFIanNJSGth?=
 =?utf-8?B?MkR0VjMwWEZUTm1CMTFRSWdKYzJ2b3V6bGFSeVF5NVcrUjNnNFFIRGQyUy9G?=
 =?utf-8?B?UFNNaE1EalMvdUJXV0tORkpUekE5ZGN1UXhPYllvYnA2dnR0Y0EydGs1MmJa?=
 =?utf-8?B?ZEFaK0lKT2VJR1E5Mkd5SXE4U21LWnJmNzYwSU5iL2VQQWpGaE5GNmxMSS9u?=
 =?utf-8?B?cFRpTzA1THcxM3o2cWx4dWNZbFJnQ3pES1M2NmRxZ3lISDg5MmgvVktWV3BT?=
 =?utf-8?B?ODM0ejgwZmNkVFE2NDEzYzQvYTJkSGdVWWNXRG1NUHVRWXd0YU8yeUI5bHh5?=
 =?utf-8?B?VTNqR0ZGbXYzRGJndXMvVVZOdDBoNFlPUlUwWjhqc0oyVFB1T2JVMXdXZjRP?=
 =?utf-8?B?Q1h2N1BDQnQ5RTZIcDY1M0JPUllmcERsVUxCRWVLSzlCaTVuTGR6VGg4bEtq?=
 =?utf-8?B?eWhDcEM3NUtxUStUYS9xTFVFd3ZsS0ZZS0pjTUdrWERmVTlTbjlldjdqK3ZD?=
 =?utf-8?B?dWxFQ0ErU1RWdmZkMHo3ZmlHdG5GVUNsUmUrVzBXdFdQZlRIajJBU3ZkTFNu?=
 =?utf-8?B?MzJzenFtTDZUKzNvZUxHRmxadHBtR2JNem16bnlUTTdIa2NFOVBxckdqU1JJ?=
 =?utf-8?B?OWpNTWl5Tnl4ZE1xNGU0cG42R0JIOUxsMVgvVnBHQVB5ZmMrcUZkM0Y2c2ts?=
 =?utf-8?B?d2lGbWVVdmVEK3F4enZFVDduMnhFa3F4MkdSMVl5QjR1S1pvbzBqMWY2UkZ5?=
 =?utf-8?B?NFNwdWd1SHhzY2NqSy9qQUtLaE1zMEZyS3Jocyt5VU5keFhSYkNIUWtZOG8w?=
 =?utf-8?B?TWQ4TTdaUUdHZms1SVA4aW0xYlNtcFBLenoyODdhbGFxZkpTY0VjTzBmMnNi?=
 =?utf-8?B?S1YzWTlLb0hwSXdSRVlQWXYyN2h3YnNBSkQ5MWlVckYya0d1R0RXZEg4QnVh?=
 =?utf-8?B?MmtaSWUyQlpvT2JEMHhxcXVsM1RuWmhQbHZITXpnOXByb3QwRWcwaFo5RTln?=
 =?utf-8?B?NGJ3d1oySVhlblJKSm9WSWw0aTZSUEppMzNpSnU4amozVFdnbDQyN2ZkdFhm?=
 =?utf-8?B?eGpHRFVHZ3Z0a0NFRjlqd3l6SXdxd0hEa0VkUUNEdmFkcmR1SVVLM2NOVXBP?=
 =?utf-8?B?U1Zncm00YW5OWkVCZDZUYjRJdnJOWVR0WFpnQTNKdEdjS0FTcCtCU0VqUno4?=
 =?utf-8?B?dFJPdWt6cDVROTBOSzAyakptakYxU0w1NWZtQ3RKbmY1WWw1YnNnV3I1NVVM?=
 =?utf-8?B?SGwwNTMwNjdXTWtNYUNZZDZUZEZlajNxVWpYc3B0OGNzWEdnYUN6a1hUNzRv?=
 =?utf-8?B?YVpQLzk4WnZpL3U4YVlhVDIrUmRpcDFrN1c2TDBURmtsdlAvZkQ3VUQ2MjQ3?=
 =?utf-8?B?VXJzNk5CMXc5d0p3VGE3QzZUR3ZzOGsxbXdMa3ZId0xrbVl3eU4zazZLYXZw?=
 =?utf-8?B?eU1qNi9uUkVMZVR6TWtBUFdaNTNJYTBmQ1NKSnVONUxmMXBTd01ZWEJTb3pt?=
 =?utf-8?B?d0pGdTNHK1E1R1JCdG1BMnIveFM4cUtGN0FPcnZJK0NNMjF3REc3VjRNa0Nl?=
 =?utf-8?B?Nm5wVVJCTkUvcGFYMWtVb0NEQVRTUFV4a0kxWFQ4Z2wxUkdSYUEvNDVuUHhS?=
 =?utf-8?B?bTNIOTI1T1phOTRnVTdKM1FZUXFUVXdUS1BhbmtGclUzekJUZXhqRmMzYkxV?=
 =?utf-8?B?c21wRHZwZ2hvOGZMMmdJNjBPdzd6OExTWXlBaW82UkJXZ3VwZGhmQkRVYVJV?=
 =?utf-8?Q?cCAk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8wWPr4AHJSgYopQg7B5RHiYEPze9TO1xFqrGpYYDa5s68rXVmDUp7fOGmbipaExHfOcGFrTrggw2neay+DmkFY+BZg2fyzV+8PcLgxpwQopiSUFuIZua/3kmo1Hb0erDMCJozQ8+MCM23vOy5rORHIm0T5yisVhE4lIbH6wa3Fo3YGvkx7YVrEyQDOOzBaLtYgTzg/b7tOVR3I35JFklnGmTTLGeFnpL5UW3ZTeNw8IeykyKaKfZr5OOxb5v/Y1icf2oRvB4J3SgWgqksWBF7BEn8+Su8ztLZ2+iKgqS95Y21myBZzVVFcwG8nZ7bvj4ULmUxLKjBSFBP9mQa6i300T2YTf9lovyyq+5ucgF2VgVBj1SO4xF4WNlcpEOjViA+rosFLxnNbUQfOgeN5grL14babJfOjpFnGHF+NbGD9gfL+kwBfD31IBQaIpOGXvb46DoRtcNQGTULokSc8WdByhJIbsg4oLRgB+TPk2FsCrynsHi9UIfsRhZUAABe7Ll85tFN7ov1eTGSq5ALecvCwXberEnBRj7k+LVbHlhS12q/RM0QT00ejPJSRHgJ3pUn2ZDT4uf+HpfOTEzUcWp0FogVA7Y6h5CVqCSL2xeoemFJOAFmNQWX6kPsvb3sK4d
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e97942-ecca-4a2a-7d29-08dd76c39843
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 17:34:20.1164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rpsx8sT8JUUhgf725MCLV9/gOV2If8fZCC4PKL6XGnDK0wM60l2W2/YAsBBsWbiGv1SRGPWoWn8Jj7tzLRjgxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR13MB6490
X-Proofpoint-ORIG-GUID: phwsD_KqQz0fBiuq37k6a6Vx_LNFYiVl
X-Proofpoint-GUID: phwsD_KqQz0fBiuq37k6a6Vx_LNFYiVl
X-Sony-Outbound-GUID: phwsD_KqQz0fBiuq37k6a6Vx_LNFYiVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHb24gU29sbyA8Z29uc29sb0Bn
bWFpbC5jb20+DQo+IEl0J3MgYSBrbm93biBwcm9ibGVtOg0KPiBodHRwczovL2dpdGh1Yi5jb20v
Z2l0cHl0aG9uLWRldmVsb3BlcnMvR2l0UHl0aG9uL2lzc3Vlcy8yMDAzDQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9weXRob24vY3B5dGhvbi9pc3N1ZXMvMTE4NzYxI2lzc3VlY29tbWVudC0yNjYxNTA0
MjY0DQo+IA0KDQpGb3Igd2hhdCBpdCdzIHdvcnRoLCBJJ3ZlIGFsd2F5cyBiZWVuIGEgYml0IHNr
ZXB0aWNhbCBvZiB0aGUgdXNlIG9mIHRoZSBweXRob24gZ2l0IG1vZHVsZQ0KaW4gc3BkeGNoZWNr
LnB5LiAgSXRzIHVzZSBtYWtlcyBpdCBpbXBvc3NpYmxlIHRvIHVzZSBzcGR4Y2hlY2sgb24gYSBr
ZXJuZWwgc291cmNlIHRyZWUNCmZyb20gYSB0YXJiYWxsIChpZSwgb24gc291cmNlIG5vdCBpbnNp
ZGUgYSBnaXQgcmVwbykuICBBbHNvLCBmcm9tIHdoYXQgSSBjYW4gc2VlIGluIHNwZHhjaGVjay5w
eSwNCnRoZSB3YXkgaXQncyB1c2VkIGlzIGp1c3QgdG8gZ2V0IHRoZSB0b3AgZGlyZWN0b3JpZXMg
Zm9yIGVpdGhlciB0aGUgTElDRU5TRVMgZGlyLA0KdGhlIHRvcCBkaXIgb2YgdGhlIGtlcm5lbCBz
b3VyY2UgdHJlZSwgb3IgdGhlIGRpcmVjdG9yeSB0byBzY2FuIHBhc3NlZCBvbiB0aGUNCnNwZHhj
aGVjay5weSBjb21tYW5kIGxpbmUsIGFuZCB0aGVuIHRvIHVzZSB0aGUgcmVwby50cmF2ZXJzZSgp
IGZ1bmN0aW9uIG9uIHNhaWQgZGlyZWN0b3J5Lg0KDQpUaGlzIGVuZHMgdXAgZXhjbHVkaW5nIGFu
eSBmaWxlcyBpbiB0aGUgc291cmNlIGRpcmVjdG9yeSB0cmVlIHRoYXQgYXJlIG5vdCBjaGVja2Vk
DQppbnRvIGdpdCB5ZXQsIHNpbGVudGx5IHNraXBwaW5nIHRoZW0gKHdoaWNoIEkndmUgcnVuIGlu
dG8gYmVmb3JlIHdoZW4gdXNpbmcgdGhlIHRvb2wpLg0KDQpJIHRoaW5rIHRoZSBjb2RlIGNvdWxk
IGJlIHJlbGF0aXZlbHkgZWFzaWx5IHJlZmFjdG9yZWQgdG8gZWxpbWluYXRlIHRoZSB1c2Ugb2Yg
dGhlIGdpdA0KbW9kdWxlLCB0byBvdmVyY29tZSB0aGVzZSBpc3N1ZXMuICBJJ20gbm90IHN1cmUg
aWYgcmVtb3ZpbmcgdGhlIG1vZHVsZSB3b3VsZA0KZWxpbWluYXRlIHRoZSB5aWVsZCBvcGVyYXRp
b24gKHVzZWQgaW5zaWRlIHJlcG8udHJhdmVyc2UoKSksIHdoaWNoIHNlZW1zIHRvIGJlIGNhdXNp
bmcgdGhlDQpwcm9ibGVtIGZvdW5kIGhlcmUuICBJTUhPLCBpbiBteSBleHBlcmllbmNlIHdoZW4g
dXNpbmcgcHl0aG9uIGl0IGlzIGhlbHBmdWwNCnRvIHVzZSBhcyBmZXcgbm9uLWNvcmUgbW9kdWxl
cyBhcyBwb3NzaWJsZSwgYmVjYXVzZSB0aGV5IHRlbmQgdG8gYnJlYWsgbGlrZSB0aGlzDQpvY2Nh
c2lvbmFsbHkuDQoNCkxldCBtZSBrbm93IGlmIGFueW9uZSBvYmplY3RzIHRvIG1lIHdvcmtpbmcg
dXAgYSByZWZhY3RvcmluZyBvZiBzcGR4Y2hlY2sucHkNCmVsaW1pbmF0aW5nIHRoZSB1c2Ugb2Yg
dGhlIHB5dGhvbiAnZ2l0JyBtb2R1bGUsIGFuZCBzdWJtaXR0aW5nIGl0IGZvciByZXZpZXcuDQoN
ClRoYW5rcywNCiAtLSBUaW0NCg0K
