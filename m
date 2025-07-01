Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0525C807
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364790; cv=fail; b=BBIWRt6Gxy1+SnYHhW059+x/z6Z3oq2Hj1Oimxnqlqk55wmQT3NptdAOYkEt3EfUxbMggm5T3L6w8/cOmhsCwNSGjSOKj/buTjAOO1f6xyaVH8wYDjlqcE/PGs4AfLST1DlpwDu8htNgLqAZ5C0nVGQVOgh6xyDz3NfDrafJzBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364790; c=relaxed/simple;
	bh=d9W0B66DcWLyphjKt9TP+M3at3QdJpwZ1MGBLxM0aV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lgiP8mbsU0pa6GGcpOM7t+r59f/pzKz5HDadFkx480PMXMZaO4JE2AEpk3wC+R20dMeUN89DaBcijUer9kvSzIzWG49rOfajZ3zVetPCzT383O8En68vsnvgeWczZbbxfsS/2gl9WKQaK9KZ7kT8caBGFC3e3ATNMLlcyVcNric=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivyEt0h0; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivyEt0h0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751364789; x=1782900789;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d9W0B66DcWLyphjKt9TP+M3at3QdJpwZ1MGBLxM0aV8=;
  b=ivyEt0h06/2A4tqQ5TCRVGDa8t/zsoHBwMO9oxjyZ2ug4DWF9/4d6ltT
   Sq/Cv4GTm/uMdAKZYYb+QMe6oQylDcoIo6yhKdo+9vY5E3EwOEMnGbZ+a
   yoZMf5ZyERQhjhQmHQe8dBAa5Hg1C1eWOK/C+1Hli/N5r3jboVprE7ddu
   ohSjM7RLePbwbRGebwOYiZ4c6wz1f/aIhtYmm+wFdYeVYXUoFofxiIXvs
   IUvO/SjUxttahKy1uLZEY05qpS9jiZtme0oF3u4GNLz9SEwGgOYSRF5ae
   SBXsx2GsZTKoalcywDeIx/DuejFgY+DE2EdcBHBZ+WhoEnzFq5TbfR4ER
   g==;
X-CSE-ConnectionGUID: a3Z7bp97TqmKESbujjxqDw==
X-CSE-MsgGUID: SytVjhTdR1m+B3Bb+ts6gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52853956"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52853956"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:13:08 -0700
X-CSE-ConnectionGUID: lb9HK1IFRlmkCX8t0c21Cg==
X-CSE-MsgGUID: un+H4qtJTTCiZICTd02H1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153506789"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:13:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 03:13:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 03:13:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 03:13:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg8ArpKSBpGJJkcygYNZxqX7eKhidV09NOb8QxojE5Ku/4nJmVv1oLUnlq+vZ4q0u+beqs0Xz9462CVG3u8KjQRpn/gI55NX2QKfnvsJ3Is93i6y7jYh8lK/3hKb5JlyTjHtGPA9fS9Yx/E4iyz9OdvTnRuLClbs/4RJD8kODZHDXu6RsERe6IiAZylKYx2brpsPfJlN9XqiVx0RdUVh2PbESDSSlkhZ/co01evzAA4tJ4g4iiBvNLnQmh25HAElRD3YbnAVc6r9Wk0LRj/qrlGyVEFgmK3hwz0PaUYaoOGXw5exgbeMxiChgnyonH5/L1wV9X1G0Q5EjvlgrIVE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9W0B66DcWLyphjKt9TP+M3at3QdJpwZ1MGBLxM0aV8=;
 b=Vnc+kQ9jCLo2qN8EmR0SJKl+pXWLO1526LhTnKHQCLceFz5Rwxz5ciwQe0K+oFEvO2GJsuUGj/ymb4eMuWx6+lrSzqWCCNvn9pQW6aWeW5Xk3jWtXxOPJTcvm3iQM/E29RkakbZo8MiJEUnKyRXM+p+IuQV52RLxex4op8wnRmmZ3WlEu4XkCoFe7u8e8cz+/bt9LqSUvvoro/AqJtn2aVCcqwjYHij7210vIZp0TyyYgbcjwOpz8F1DfAb37fGTz4KD0+exUSGmmtjkGyvB4tWUyXzrFis5v84fNVwD/tzDcHC6IZdF6SmPz23dAb1qIf63RSeF6o/sHO1SZATWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 10:13:05 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 10:13:05 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2 4/5] mei: more prints with client prefix
Thread-Topic: [char-misc-next v2 4/5] mei: more prints with client prefix
Thread-Index: AQHb6aIDrV6CltoeCUqcwJ+jWxGwL7Qb9LqAgAEXeOA=
Date: Tue, 1 Jul 2025 10:13:05 +0000
Message-ID: <CY5PR11MB636624BE90152D1119EC75A8ED41A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-5-alexander.usyskin@intel.com>
 <2025063003-doable-magician-3218@gregkh>
In-Reply-To: <2025063003-doable-magician-3218@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SN7PR11MB6773:EE_
x-ms-office365-filtering-correlation-id: ee539fc5-ee02-4d3c-b32a-08ddb887df0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MTlVYWlrbmlONjJ5WHB5RHprb0ZBVnZXZ3BDSDI2ZFU2VXBXMmZRYmpwK0Yy?=
 =?utf-8?B?L0xCaDdJeHpuRHM5WGdNcWpZQTYzREk0WUVEc1ZYSy9lbXBGUjA3d2ZsY1Zz?=
 =?utf-8?B?eUV1R290bkUyZU1ReXVCbmI4OTF3YnRNUmlDTmxHNXUyVWlTV3RyVTdZTWxl?=
 =?utf-8?B?dmNQSjNSWjN1UTZQUXBVV1ZFSGdCUTRoMjcyUXJqSkgzT292Ymo0RW9kdGtv?=
 =?utf-8?B?dis0ZmNpRjYrVFExN1FDRXg1R0VJRTYxSDJYZzk4VklCUFBsQUk3WkdFczZw?=
 =?utf-8?B?aEV4RWhYV1dDNlo2K2V1M0xHaE96eWwvWW5XeDV6VGdFV3FFV0dxT1RGM2F6?=
 =?utf-8?B?Mlo0cXg2bEpGM0JhWG5IYi8yL0dvMXZOdm10aUEySXhHKzNEMlZxKzFGeFBU?=
 =?utf-8?B?VUxGQkE3THY5b045SXk1UWtBdGcvcHI2UkdCNjduYVdJVXhyN01STUJ4ZWdB?=
 =?utf-8?B?OGpkNUt5WktyU2kvbEhOUHljK2tyYUZ1RUlHVlo1R2M1MVFtcjFxZDRNY2Fo?=
 =?utf-8?B?R3lpZllib2NLWmFlTVhPa24rN0Q1K21Bdldzcmw5alRyZkl3OEM3U2ZkbExz?=
 =?utf-8?B?UWdzRjVtQU16cDNOaW1iZC8vVFp0RTl5YmxyaERtSHg4SVV3emZRaEh0T0Uw?=
 =?utf-8?B?SzJwM2ZHdk9vQ2dTNTlDWFdsV1BHaWxYRHFRYXdpbmlDZlQ5NUJwMW5ROWdH?=
 =?utf-8?B?dmFnTWUvWmY4b1ZaYUR6NVZkNmZRY0N6M3VNYXlTNG81bFRMOVJLdmt5aUsw?=
 =?utf-8?B?SERMMlZOOC9WZmhWcVU3TDljdlZSYXlVZGJCaGdMZkxvRkhsdkFVampUU3lZ?=
 =?utf-8?B?TFVVTElhSmRzbzFxcm8vY0ZhUHVuY3JPZTVBNDF4TEJqM3RlZzA4blhyc3I1?=
 =?utf-8?B?YnhLUFppQ01DcHNVNStna1hucnJETENiRS9NUFRIb3kzZFFVT2diYjFGRXZB?=
 =?utf-8?B?R0xkYmhPMkVCWEY0VHEzL1dqbzRiaDQ0QXJBUzlJcDJUZXN6MUVlRlEyQmtt?=
 =?utf-8?B?YW80dVg1bklCaVlzZ1NqeStiN3BSSUJzUGQxY0VMRnRxQitWaVF6NHlVeXhr?=
 =?utf-8?B?aCsvOWxkelpYNzRlTHVGZVNyNERZQmRBNTVhRDBZaVBvbi9NU3pUMkl0Wk9I?=
 =?utf-8?B?UjRoWkZRSFpiYy9zOTM4cmV4MFlpNDFTWmQwbnkvK0d4VTBvNTJrcUNPYVZ2?=
 =?utf-8?B?OTkzb3RIdERmUDlXYjkzNXp5aU52VStFNW5Bczh2SGNwTjJ2a1lhUUJoSWNo?=
 =?utf-8?B?UnF6b2hYWjNETFpXY3hleklHUlRWMkFkQ2N1c21mYk5JdmRnVE1Lc3lqaHJE?=
 =?utf-8?B?Qm1HSGtBSUJBbGYrc21DQk9DQm15b2tPOXIrc1ZkeHlBRWVMQ2ZZUlhiZVdX?=
 =?utf-8?B?VDJqbEJMSzVtRzdBdUp0WGw2VHJYQUNHRUNZRHgyMlhvMWhtRUtOUjQ0ZjRy?=
 =?utf-8?B?TXp3WTNBT3RYNXZxUHArSGVya0FYZFZpTEo5WU9JRHBxTzJBelU3YzVKaGNQ?=
 =?utf-8?B?dEU0V2lKVDNOeUdQa2REcTBWanRITUpkY3hLamNtRVpUTzJGcjhSTUdMc1hY?=
 =?utf-8?B?S0hPbEZqV0tGRjVDUWl5bDh2T0pSRnl0VUNBT3lFS1FTemlzUUhPaGcvSEgx?=
 =?utf-8?B?VEYwd0hzYmRhR3haV1ZQcHd4QVJKb3E3Z05vRTBSUk9LUTUxNWwxVFpCRnZm?=
 =?utf-8?B?MllGTGtnTXFJQjM4R0R3SjFRNUVQQnFXSHgyWVc2eDZhc25KMDRJbEFja2kr?=
 =?utf-8?B?bURGVEZaTUFmdGlRU1hmNk5wNXlsNEhObTM1SnpYejkyVTJiV3FxTU1MVUpM?=
 =?utf-8?B?YldLVitxNDhHb0EyRmdDZGdvVURtVnVGejRPRUs1RUdvSmFGR3htRVVFcFNa?=
 =?utf-8?B?TFhqMkFuejVBSUZwQkVuQm9EN1Z6M2VubjIrb2lJWWFZaEhOcWhwYzlUZVFu?=
 =?utf-8?B?bEZLQktWaHo2VWV4TXczdmt2TmttOXZHRUwvQ2p4OUkrWVdMVk1POHNOaUZX?=
 =?utf-8?B?bE9UZEpsTzhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjZWdTRVbyt5RlpzQ3ArUCsrVWhraklFdUdCajRjMXdCODlWbFZqZ3Y5RjZm?=
 =?utf-8?B?MXZEaDdadzdxUmFhMkxvTmZtaEU1OG9IQzBCeUNGZTMwbjZEbnFyWjJndTBY?=
 =?utf-8?B?c2YzWHAzZ09GUmtoa09HMGJ5SXY3R1BnM3NTd3NnRjVYdUpwYzNUTjhyVHlW?=
 =?utf-8?B?T1ZYYXczdGRIYWdmVGVMc0RKRDFqdVFzc1p5aEpWVjZUT0NHQ0RSOHpoYkZR?=
 =?utf-8?B?MTRqRXhCc0ZyTnFUY1pyRGdIUk1iWlVnUTF2SlJWVEdtV29lWmZaZVpKUnV4?=
 =?utf-8?B?RjVqODFvQmdRVUpwdytBZlVtTHFtZW9aaWJhOExZVTNpQlU4Q3FUc3dPdGpZ?=
 =?utf-8?B?eFpISVo4Mk5FQmtsek1ZdWJ0ZThoOUNhRzJSZjhwY1oycW85ZXZCNDVzeFpt?=
 =?utf-8?B?N0xJT3IzelBDdUszTjdIYUVBckNIN1MvZnFYM0E4anJzTUdnN01IVkVhWmZP?=
 =?utf-8?B?bU9ySUYvaURnaXZ2d1dTQ1RGM3FsbXZ5bmhZMVJwVTJUUkk5L29TbjU0KzFJ?=
 =?utf-8?B?MmpSNTBDQzNNWHZmdnNrZjIvdU5UMjRpOUlSaHQwUGNUNzZ5Y3IrL285bDBn?=
 =?utf-8?B?YkU3dTYzUTlpeVRwNmtDdnRUYXNWWVNha1dGOUptZGxnYzVreUdydENOT2RH?=
 =?utf-8?B?OXJNN0N2UnJlYmVENWVjbzRFOHI1ZGNTbEVsLzhwbHlsZnlabVd3N1lWTnRL?=
 =?utf-8?B?VVBiRk5DUURlOU5oN0FhYU42MWs5cWF1V2RESU52Mk5QSzNyc21qQ2p0SWg0?=
 =?utf-8?B?NEVjMlAzVUJ2Z1NOZDBkSWNvSjE1UzB2b1lGNERMMXBLNVg2Q1Bjd3NXcHZ0?=
 =?utf-8?B?ODZZcVlTcWluMzN3YVNQcGpFbWh5R1haRlViUnlhNUZMMS9KTlNGV1ozQjNM?=
 =?utf-8?B?RE5FS2ZRUjF6SUlUeXVDMVIxWDB5UFFjekJETGQxNFNmbTVSeXgvZmNUTXJa?=
 =?utf-8?B?QzUzTkNRKzBOV0pUR0cyMENMUUZ0UmE4cTBsZUZXK2ZuUjNVSHYwVDVBQkZV?=
 =?utf-8?B?empvcWRBS09RNWo0b08yeUtpNnA1bUhqcTlSZUlFc2Y3SzZGSExaajZRMWJS?=
 =?utf-8?B?V1ByZENKVjlPVHVIWU9MdjhSWnRvcnFzL05wMVFHeldVaXpaM1k5a0szREdZ?=
 =?utf-8?B?aHdpYklyMGRudHU5YTcxUXhtY0VXa2JMdXF4a1VsRzhIZGFhTlFFNENmTkZV?=
 =?utf-8?B?eFNKdHpXWE1GakZuQm9KaFE3QlArb1BDMXFHdVliZjl4UXlURHVvSHZqRW0w?=
 =?utf-8?B?M0YvY0xOUjFpWDlyQytxejJybHR5ZmpoVHNkRERtaG00RmVOVEp5UWRXRXkz?=
 =?utf-8?B?c3NhY3dBM0RIZWRFQkplNGVFWnNDMU55ci9TcXhMQTJMU050Z3AxN21kUVAw?=
 =?utf-8?B?YUNML1AvSkxVWWZGeDJITmozZlNyTGY1cG9zNHZqblI1dEp4citTYjZLUm9r?=
 =?utf-8?B?cUN3M0VqY00xL256eWZ0U2FvcmdydEJKKzdqbEhMcXQ2SXo0RG82K1l3NmpO?=
 =?utf-8?B?RnBYM2oySFc2M2pRUDFGNVl6elJMWjc3cVVUZkNHdExqTnhWWDZvam1wMDFR?=
 =?utf-8?B?VHF4dnJQWEQ0ZlkzOVZMdDV4RGN2YkdVb1hNVnN1MzA1V1NSTlUwajFxQjAv?=
 =?utf-8?B?Y3NXZ3FvaG1OOG9PanplZlRSV1NkNUtHWlAyTFREa0ZST2hzc2ZGa2tuNmNF?=
 =?utf-8?B?VnpYdlBUTWljUmdYSEx5eHFqdERPQWphUzkyYkNQZnBPSm9PQVB6cDhhZjVt?=
 =?utf-8?B?K0VZWThoMjk5enNZRmVVNTFnOWhBWnRhWFFsNVBOV1J5ZndZRE1pQkNDcEZH?=
 =?utf-8?B?STZPMVdjbkxVa1MrbDVJc1J2NEttQTNzR2hRdnZCMjhUSUtRajhVU2RtaXBq?=
 =?utf-8?B?WFhWOXFheTNmanpSUkp0RDdRQnZ1aUoxSktUdCs0Uk04eGZ2RkZKVEVwRVdl?=
 =?utf-8?B?SDdOSXZ5VlBlTmhBOEFubGJKNEkrbEg5TWt2L0tLOVVucGs3VEYvSXJkVWZG?=
 =?utf-8?B?bWVSRXgvNmpTNXk4dUNUL3VPWlBpVUNYWFRlTWM0eUNRd0RPeVIrWWthVkQ1?=
 =?utf-8?B?ZGJtOW1nVFIxS2EvUisvLzAxempYOVJZUjdwOWRrM0ZWRlRVbkFIVVNQWFJ4?=
 =?utf-8?B?ZERqQURZNWo0ODN2R3p5SkZkZlQxZU9aNEhmdzVpU1g5d3JjR2ZmbjdNakQ4?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee539fc5-ee02-4d3c-b32a-08ddb887df0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 10:13:05.8354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fg3D64ceYzy9vVyo7Nk5THPiUHPKkxdZpJmD0Di5ksJaj1wo6PxP7cjW5KiDmhmfyDthr7R6gamU9bEwlmNmQ5/NWUnKzYPZYHh9SJcYxYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyIDQvNV0gbWVpOiBtb3JlIHByaW50cyB3
aXRoIGNsaWVudCBwcmVmaXgNCj4gDQo+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0IDEyOjE5OjQx
UE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IFVzZSBjbGllbnQtYXdhcmUg
cHJpbnQgbWFjcm8gaW5zdGVhZCBvZg0KPiA+IHVzdWFsIGRldmljZSBwcmludCBpbiBtb3JlIHBs
YWNlcy4NCj4gDQo+IFdoeT8gIFRoaXMgY2hhbmdlcyB0aGUgb3V0cHV0IG9mIHRoZSBkcml2ZXIu
DQo+IA0KDQpUaGlzIGFkZHMgcHJlZml4IHRvIHRoZSBleGlzdGluZyBvdXRwdXRzLCBiZWxvdyBJ
J3ZlDQphZGRlZCBtb3JlIGV4cGxhbmF0aW9ucy4NCg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9taXNjL21laS9oYm0uYyAgICAgICB8IDE0ICsrKystLS0tLQ0KPiA+ICBk
cml2ZXJzL21pc2MvbWVpL2ludGVycnVwdC5jIHwgIDIgKy0NCj4gPiAgZHJpdmVycy9taXNjL21l
aS9tYWluLmMgICAgICB8IDU1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9tZWkvaGJtLmMgYi9kcml2ZXJzL21p
c2MvbWVpL2hibS5jDQo+ID4gaW5kZXggMDI2YjFmNjg2YzE2Li40ZmU5YTI3NTJkNDMgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9taXNjL21laS9oYm0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWlz
Yy9tZWkvaGJtLmMNCj4gPiBAQCAtNTEwLDcgKzUxMCw3IEBAIGludCBtZWlfaGJtX2NsX25vdGlm
eV9yZXEoc3RydWN0IG1laV9kZXZpY2UgKmRldiwNCj4gPg0KPiA+ICAJcmV0ID0gbWVpX2hibV93
cml0ZV9tZXNzYWdlKGRldiwgJm1laV9oZHIsICZyZXEpOw0KPiA+ICAJaWYgKHJldCkNCj4gPiAt
CQlkZXZfZXJyKGRldi0+ZGV2LCAibm90aWZ5IHJlcXVlc3QgZmFpbGVkOiByZXQgPSAlZFxuIiwg
cmV0KTsNCj4gPiArCQljbF9lcnIoZGV2LCBjbCwgIm5vdGlmeSByZXF1ZXN0IGZhaWxlZDogcmV0
ID0gJWRcbiIsIHJldCk7DQo+IA0KPiBXaHkgZG8geW91IGhhdmUgYSBtZWktc3BlY2lmaWMgZGVi
dWcgcHJpbnRrIG1hY3JvIGFueXdheT8gIFlvdSByZWFsbHkNCj4gc2hvdWxkbid0IGRvIHRoYXQg
OigNCj4gDQo+IFRoaXMgZmVlbHMgbGlrZSBhIHN0ZXAgYmFja3dhcmRzLg0KPiANCg0KY2xfZXJy
IGlzIHRoZSB3cmFwcGVyIGZvciBkZXZfZXJyIHdpdGggYWRkaXRpb25hbCBwcmVmaXggb2YgY3Vy
cmVudCB0cmFuc2FjdGlvbi4NClRoaXMgaGVscHMgdG8gdW5kZXJzdGFuZCB0byB3aGF0IGZsb3cg
dGhpcyBwcmludCBiZWxvbmdzIHdoZW4gbXVsdGlwbGUNCnRyYW5zYWN0aW9ucyBhcmUgZXhlY3V0
ZWQgaW4gcGFyYWxsZWwuDQpTYW1lIGZvciBjbF9kYmcuDQpUaGlzIGdyZWF0bHkgaW5jcmVhc2Vz
IGRyaXZlciBkZWJ1Z2dhYmlsaXR5IGluIGNvbXBsZXggc2NlbmFyaW9zLg0KU29tZSBvZiB0aGVz
ZSBwcmludHMgYXJlIGludHJvZHVjZWQgYmVmb3JlIHNwZWNpZmljIG1hY3JvIHdhcyBpbnZlbnRl
ZCwNCnNvbWUgYXJlIG1pc3NlcyBmcm9tIHRoZSBuZXdlciBwYXRjaGVzLg0KIFRoaXMgcGF0Y2gg
aGVscHMgdG8gbm9ybWFsaXplIG91dHB1dCBhbmQgbWFrZXMgY29uc2VjdXRpdmUgcGF0Y2hlcyBz
bWFsbGVyLg0KDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQoNCi0gLSANClRoYW5rcywNClNh
c2hhDQoNCg0K
