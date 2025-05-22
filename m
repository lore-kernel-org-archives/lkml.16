Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2075.outbound.protection.outlook.com [40.107.103.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BE8A50
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875127; cv=fail; b=CT2PCW2v+kaML1Pj3HgX8QdkIQdRyljkP+rmpCSsuSvldOHKuuCifaLOXwbOhqoBYfRvfJRFvs4oZ1CIZrf5FGn3I2lzK51Iy0iVU2NPchnKITnARat+/NEVXGDDSTDsTyOGBQRC6CG4Q9HKqkm2ECfR7Eqx6unYOTix9/tWCVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875127; c=relaxed/simple;
	bh=+fK8WaJQJE3jD5w/SapHRWe/A2/1GKFvru/Bs4qTRXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r+UzM3yp7YpAUinK+fSgHMetm4ueLrXVcaNOP50xhfJclViQteC28I99g3ktmJRP0f6KoycOPR9jtqyOmCE0iVxLzr8DwTWhVXkdxMoY+fnlt0Q06i/O3/P89uZiyWMZ+Km4iD9rmjG+1maLOE2xOp6dpf4umhhKkBOwMJ7eLsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHGCi1+Y; arc=fail smtp.client-ip=40.107.103.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHGCi1+Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHzXi2KD9sEUe41x9S5Z/m+8eb/DEU738e1zWK/3+mirjwWqtjPUOjOQH3WsLd0E+6URu0zddbGtrMcq0dIM2nX7MxTriVrdpZqdKI8DT5D9NY30+m+J0/3WifoM7IQolEy85SqGejzkPKwIJ/D16aR97I8PqUZ3I9i8pmKIKRfe/7n8nSjYBLebJffo63OEU92BbFxMGyoe+Xi99orQlh8YkXy7qHftqH+9JLPtkQHBUWcK5l/MD3Df+KJ506NGb7tcZLwYt12fTYcqV6o4GzGQBaavB81p1CpHP53oz9nP4gXYY6GKHQbBT2HvCPpnph3/LkwFqbnWoYPKSMXoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fK8WaJQJE3jD5w/SapHRWe/A2/1GKFvru/Bs4qTRXU=;
 b=lD/ARnk6CX/PuxsgedZy1qQbh1xZ+c/sCrnlWbsRUmhLqX4sCAXUXk+I8efFrEPidKijM6CLqaktCyxPGN7QcYHBhCKEDqfwaMwhyZdTZzGGn20eo2NVJnQVyOyObonJxI2RutMTbSR/ev7engky9632GkJNjgo2Fa257Oy4svnOftA4CKHsuE4fL7x+IzLOWdPrQcAoWmV6vg/EjMLV/4JFo/ndVxDBO/9EeIUWTcbFPr3qtWoYdUIiEm8KHO/Z2VCIOzIWl8tTWpDO6wcPJsCuVOjD3toC6UmFOXXMyfMfeLJa+UTqNpfSfLrngz2z8C7mcXp06WuWPmIDNsW2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fK8WaJQJE3jD5w/SapHRWe/A2/1GKFvru/Bs4qTRXU=;
 b=hHGCi1+Ylv3N9MJcy7+DPY3ffXhtsiAMX2/CQ/tSAE8R3nSdyrEFcmZZAzz31V/Y6ZvN0d3GnLKGVQnYCTM1IeL4ccP9oBVxFR0xD2anah8lz7o5A0bdd1g5smjhxofcji7/BbK7q1WcZ7UkRceM1o6U1mEMy+c//68VobGxndrMJRaDVpKOXlNkgoSTAJQkVu85wfRW13BJ3YRF7x4/aP8k4omqQoClg7NEs023wwVutdeyeN3AW5OWyQvgFHElAvXiNOqIifh0tPQmqnQk/L4SHHc24iNMpalF3TPBXWbrY12emeIVZxkEPNPcUWqWluUo8Zu/JxS8Fl7YwJlKyg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 00:52:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 00:52:01 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Jassi Brar
	<jassisinghbrar@gmail.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, Elliot Berman
	<quic_eberman@quicinc.com>, Thierry Reding <treding@nvidia.com>, Sudeep Holla
	<sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mailbox@lists.linux.dev"
	<mailbox@lists.linux.dev>
Subject: RE: [PATCH 0/6] mailbox: Trivial updates
Thread-Topic: [PATCH 0/6] mailbox: Trivial updates
Thread-Index: AQHbquPTP7beXx11fkmSFG2zB/1ulLPeEY1A
Date: Thu, 22 May 2025 00:52:01 +0000
Message-ID:
 <PAXPR04MB845984111A32B341294716C48899A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB8001:EE_
x-ms-office365-filtering-correlation-id: f2854042-2e1a-4173-662f-08dd98cadd06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QW5LVjFTYTROVHJSb094bU9SOXlva2dnVzVRRTdMS1RzbFgzL1h1cDJXZzFS?=
 =?utf-8?B?NU5NYUZQL1I3T3l4RVIzelBZdndMTnpFTkI1SnlrRzEyVHQzY3orbkNBczFL?=
 =?utf-8?B?N0sxU2hZVHFqMFBwYzlNa3NOakhGSW1Wbms3THJYM0d4N0tOcWlhZytQeGkw?=
 =?utf-8?B?cVdOdExST0M0bE9uNmtQaGo5ajR5M1RsbVRsT0hRSXNwUmJWc1Y1dE1tRktl?=
 =?utf-8?B?L0xyTkNVZ3grUHZONExGQ0dqc1lRM3h4WVk5dkx6MkJ6L1JjdlVDc3BGUEVQ?=
 =?utf-8?B?S01ScXhLOXU1SjNBTXhka3A2and5OE5jQ3k2dnRVWmRna0taOGRLUldPSWor?=
 =?utf-8?B?WklCVTI0eUJsUzM1TTBIMFB0aTdacDJtUytZeExMVFRrMUNBNU44N29wcFNp?=
 =?utf-8?B?UWtFcGc1ekVWY0JFQlVHTCs0N244L1VGMnpkUkpXbmE0VDNoOEFUcWYxM0Rq?=
 =?utf-8?B?QnZ2QVZoQjRmMHF3Unc5SkdYUnN2YTY1NXdqSGNHZXJBZk02bmhicFQwMnE0?=
 =?utf-8?B?QnVQSGRBTUlWbkp5eFFxNll1MnpUS2kxRUVaN2NmSmR1S0hVQ2lTb1dmdFJH?=
 =?utf-8?B?T28vdFhNUjBFSUIwNTQybmtXVG10WGthcjM3azhva0ExTHBrcjRnUmo3Y0hN?=
 =?utf-8?B?NjBPRC9Fb2xKalNCVHpLcXJPM3c1ZkszN01vTVpoSkhRL3RiTGcvWDlnMEJs?=
 =?utf-8?B?SkJqTjFIZXNNbUFpMnMrMytpMFJ0VGFqRmpoWThMRVVZTE5kZnZlalQ3ZGp3?=
 =?utf-8?B?anRyNTdVdWhhcjVlOXdmNzQ3RTZvU1FVak5xck12Slh2K3hJZ096eTZBZi9C?=
 =?utf-8?B?YTRpaUsxNkFsTjU1WDBhNmlCMXRidlEzQVZxU2ZmYWpVWVRyRVorMUZFWjNB?=
 =?utf-8?B?N0NqUmNoOEo4QUVBejNsY0labEcrNVNsR3RqUXJ2YTNKb2IrbjcyR0cxUEt1?=
 =?utf-8?B?L2hyRW9wSjhaZlVScWFsOHRhWnpxdkQ4R0tiMTJQdHl6V0tLK1FFMjBSbHp0?=
 =?utf-8?B?Nk00cmhlMzZjOGVVZlhaYW1LODk1MGZKOUpBRFQwTDQvUzhQVW5EcklXNUtG?=
 =?utf-8?B?RWwxVHNFUmdTc2NuSjFFemFtRHp2ZkRhNEdWRjd4aFNTOGhPMit3RVBBc2sy?=
 =?utf-8?B?T0o1L01HV29GQUNRdkpPYW1MWlh4WThlSGxYbHVDcVpVNGFaYm9SdE8vZXV1?=
 =?utf-8?B?QUhqTTN6OCtDU3BvRVBlL2lkMVl6akhlSlZsWkN4aXJUV0NDUDVhRXZ2Y2VR?=
 =?utf-8?B?WE5kYkY2ZG9qYnoyNDRlMS8wc3g5d3pTNkJydGpJRjBObGZ2QWRWNW9yY0Zp?=
 =?utf-8?B?QWd1YWpkaWx5cytrclk3VUJoeFJHZjhwM1NqQms4czZNZGpsSnFXWmVkMnRj?=
 =?utf-8?B?SEQ1WURXclNRajkvOXJZaW9pTGQ4dkcyZG1BdUtYVVJWTW84Yi9XbHpYN09U?=
 =?utf-8?B?c0lraUJ6NXNlV1Ftd2dvQTEzL3N5M1A0ZFpTeW5uc0NtWGlWTEJnQ2JRcjJ5?=
 =?utf-8?B?NHg1VExCUkdQTHNlZE1rZHUwRjk0MklyM1hUMkZlSkZ2UjdLRGtoQ0dOOENH?=
 =?utf-8?B?QUJvSXZwaTR4N1Znb0dzSTRhdTJOQ3RZTlZGaXo1bHhIZzRicTE2UkE3b1dJ?=
 =?utf-8?B?ejM4eHBTdmVWRWd2RGl3REdBTnk1SVZmaEsybEpPcFViWFpPYWxUbCs0QVND?=
 =?utf-8?B?ZzFOdS80K0JMaVE5NEhpZGhOd0VCaTBhWVZHTnhEYTJSV1QycFlvQVcwR29i?=
 =?utf-8?B?SWF5bERzK1BrVk9uMm1SbFF6MXhOU2ZyRXV4WStueU5SU0NnOWFtTnR5R1Bi?=
 =?utf-8?B?THB5eXVqZnF5ak0wcFA2N2dLdlNUWkt2RFh2RkgyV0dtWmRVSjJQTEFtNGFN?=
 =?utf-8?B?cWJQSStjODhLRm5TUzRLTUxlczlBNWhQOTc1QXExQ1RiUHAwSjdQWEtTN0Nh?=
 =?utf-8?B?Z2FwbHU0MjMyTkVxOTBSTFp3OTNPVm1lcXhrcVJpUVNmd2lIdDZIUUlJeEtt?=
 =?utf-8?B?QmJFS1VWRU5RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1Axa1k5TVV0TTloUUVyWml4bDZDYU1iQnBhckkwWUFTV2cxb0lDVkNaQjlx?=
 =?utf-8?B?bGYveFhCODhyaU84bWRvc1BadWhINm82b2twYjVTMUdXUGN3ekVBMXoyTHBU?=
 =?utf-8?B?WDFSOHZuY0ZyWVFNWmEzOHExTkJMKzFNaUJEWkZ6UTAycFFobzByZWtTYjE4?=
 =?utf-8?B?RkJMNnlYSld2QzY0OTZIdWIzeERuVUVtbGNYS2ZXK3BZTkFDRnAzQXk0NE1s?=
 =?utf-8?B?VU1abE92MXQ4NFFTc05GRUlNT29RbWFvWG1DQS81Qm5GaFZGeDZxYkw5bWpx?=
 =?utf-8?B?WWl4SXYxRm9aTFVXYzBTdHNNc1Nmdy9kR09FdGtKSFlBbW50RUg1bGN0QnVz?=
 =?utf-8?B?dU1BSGtvWEZPTC9pVGJzVGxCUHBmWWRMSWU3cC8zSjlGYy8zRlJDV1ZuUjhy?=
 =?utf-8?B?REdpdW5hajF1RGZFZnRGMGNBdGg2SWpycjBJa0F2cCtqdThMdUV2RTdSV0E0?=
 =?utf-8?B?SHkyNkcycTBVQndoakxLSDhZOWtYTDc2cHFFVlBnM2RQMkZlY0hJYmxEby9W?=
 =?utf-8?B?cUlENGhkM05QbHN2TFdTQVNGVFRLeGc0NTJIcm5ZNERFOUd6VFRYbnBTQ1FP?=
 =?utf-8?B?a05nRUk4ZTBTSzdtd3hqVUpNeXpaWWVBbC9lbnFpRGJaQ1drckJhandQd3dn?=
 =?utf-8?B?NnR2QmxocVVwVVVOZFZ0TTlDclhnK2ZFS2xuMUI2TUk4aXF3K3Z0YWR2dlV3?=
 =?utf-8?B?TXM1ZitJdEdrWUplSkNETG5VOWFpaHl1bmZjVDV0WUpvTnpsUnozQmNvVWxj?=
 =?utf-8?B?QnZadVNZZlMrWDQ0Z3pOWjlDMk9IWFprTVNxck5vbjBpZzdaQkprSDFNZjho?=
 =?utf-8?B?aGZQU2xhR1Z2bUlvYXBFR3NWTGh2Z0MzcHliazEraE02dThyT2w5S2tydWsv?=
 =?utf-8?B?dkszR3EvRTNQTjhQYkk0WjNkZms3VmsrcWI2c1Vqd3ZtSFhxdjQyMDRWYjFm?=
 =?utf-8?B?WTd2V2hhRTdRQkFNWWY3SUtnRUJvMVJXUDN6QWtqT3BNQXhwdUlzMWowdlI1?=
 =?utf-8?B?aU5EVTZBdzZ3eTlRb0RucVNBM3AyM0JxUXQxSmIxWW1TMUVqZnhQMG05a1My?=
 =?utf-8?B?N2pkK2gwaHFRclhyT0tFSlRKcGNzcGU3aUdzQjE4VHNTV29pbnZ4d1hnY28z?=
 =?utf-8?B?TFhSZUZHUnV3L3Nod2ROWE81QlRFTjVsa2ZvS1RjUVo0WG9ySWR4cDNqSGVK?=
 =?utf-8?B?UW5Ha29paWh5RFc0ZlkzMmVUMDdFMmtYL29KRVluUnVZRytObXJXNkVWbW9K?=
 =?utf-8?B?YTN4Z0tUY1dxMkVDa2ZiMzFEWVI4eTgvL0RINHRHUUtFbVZxcmFPVHRIVHZp?=
 =?utf-8?B?WjdZejJJdEp3TTJtRTFGcVQ0ZTVSODJtZldna2ZVRDd6TDFqS09XNWt1SW8r?=
 =?utf-8?B?WTVMZDl5TTFTa2tnT0xmdU1ScVBSamEzL3hRMUtSMVg1YWxFT0xKNnh4a2VH?=
 =?utf-8?B?dG1wVU5yVW8vMmVkL2ZLb3JhYlNQL2FJRjBaM3dGNDJoUlNQaDZ3bXhQNXlD?=
 =?utf-8?B?UC9QNzRiTzI5RXlUTkhKeE43RHE5aENUUzlycTJSZVFpb2gxVkZ2Zkk1cVVL?=
 =?utf-8?B?TjI2Mmxtdjhhd1VWa1htWWlxWVRzS0I2MHovanhyZFQ0WlArckFVYnFTSW55?=
 =?utf-8?B?WjgvKzJSNTc5TXo4NmxRWldSQXdCS0xFdWRubG1UaG1lTkVFZ2NQWFhJK2s5?=
 =?utf-8?B?a0krYmpySWVYc1RUQm90c3daTFd5aHlLRzJJY3U4MnJVaHJybitUQUpqUkJv?=
 =?utf-8?B?NG1Hd0xNeTNTb2ZGQzdSMGtDdEE3RlRlc1ZvNkhvVjRBcFhRWTBvcUhlM3NL?=
 =?utf-8?B?Nm4wWHpmckZ5c2lab0cvb0hEMnVLSk1mUnI5aEt6WnJKdFRIUllLaWZEMGhP?=
 =?utf-8?B?aWZ3OVZQZDZDY2czUXlMMy96b3FteFBZTitIVmV6MFVxNjRRcVMxUkNML3R3?=
 =?utf-8?B?aVllMWFrNDUxVm8zRmx5RWNhSGJRTnNKaDJmSWlqWjVVaXN4VmwvaW9DMW1R?=
 =?utf-8?B?TG1XZmJxSndIcFpMNDAyT3AzRWhPSnYyZTRpU25CRUlVV0dmcmhyM3liMTZn?=
 =?utf-8?B?a1o5WlAyTFVTQXBPQXRzcmZycE9DcGh4ODVQc0QxMW9taklmTGtXdTRsbzJU?=
 =?utf-8?Q?EU5Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2854042-2e1a-4173-662f-08dd98cadd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 00:52:01.5094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqMZzdCqFiO2XW7r5TpUJq2Xc3ZK8d7YBNu6rtlZnQ5eshx4hjMjt/Hc3BKUPo0Vlq9erusUciQI9KPmO1SKrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001

SGkgSmFzc2ksDQoNCj4gU3ViamVjdDogW1BBVENIIDAvNl0gbWFpbGJveDogVHJpdmlhbCB1cGRh
dGVzDQoNCkFueSBjb21tZW50cz8NCg0KVGhhbmtzLA0KUGVuZw0KPiANCj4gU2V2ZXJhbCB0cml2
aWFsIHVwZGF0ZXMgdG8gY2xlYW51cCBjb2RlLg0KPiAtIHVzZSBkZXZfZXJyIGZvciBwcmludCBl
cnIgaW5mb3JtYXRpb24NCj4gLSBwcm9wYWdhdGUgY29ycmVjdCBlcnJvciB2YWx1ZQ0KPiAtIHVz
ZSBndWFyZC9zY29wZWRfZ3VhcmQNCj4gLSBkcm9wIGRldm1fbWJveF9jb250cm9sbGVyX3VucmVn
aXN0ZXINCj4gDQo+IFRlc3RlZCBvbiBpLk1YOTUgd2l0aCBTQ01JIG1haWxib3ggVHJhbnNwb3J0
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gLS0t
DQo+IFBlbmcgRmFuICg2KToNCj4gICAgICAgbWFpbGJveDogVXNlIGRldl9lcnIgd2hlbiB0aGVy
ZSBpcyBlcnJvcg0KPiAgICAgICBtYWlsYm94OiBOb3QgcHJvdGVjdCBtb2R1bGVfcHV0IHdpdGgg
c3Bpbl9sb2NrX2lycXNhdmUNCj4gICAgICAgbWFpbGJveDogUHJvcGFnYXRlIGNvcnJlY3QgZXJy
b3IgcmV0dXJuIHZhbHVlDQo+ICAgICAgIG1haWxib3g6IFJlbW92ZSBkZXZtX21ib3hfY29udHJv
bGxlcl91bnJlZ2lzdGVyDQo+ICAgICAgIG1haWxib3g6IFVzZSBndWFyZC9zY29wZWRfZ3VhcmQg
Zm9yIGNvbl9tdXRleA0KPiAgICAgICBtYWlsYm94OiBVc2UgZ3VhcmQvc2NvcGVkX2d1YXJkIGZv
ciBzcGlubG9jaw0KPiANCj4gIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LmMgICAgICAgICAgfCAx
OTkgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0NCj4gIGluY2x1ZGUv
bGludXgvbWFpbGJveF9jb250cm9sbGVyLmggfCAgIDMgLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3
NCBpbnNlcnRpb25zKCspLCAxMjggZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDog
YzEwZmU2MDA1YTQ3YjQ5MDk3MTE5NDg4ZWJiMGNjODAzMDE2MjNhOA0KPiBjaGFuZ2UtaWQ6IDIw
MjUwNDA5LW1haWxib3gtY2xlYW51cC01NmQ5MjBmMTNjYjgNCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gLS0NCj4gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQoNCg==
