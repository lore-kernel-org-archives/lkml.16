Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53FF15AF6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461025; cv=none; b=qafGm/ZCQsu8kaBmkv/JyXpUCkYmpV4/w2c3j6FFVZ0RNozXdmmU3VWFNL1fWWZVUF0UvZXv3ei4zTXx6T8+HA+pCG6y0tBB3LAaTs1IiNycMR9HFMQgFIRQF+XybwLWuO601gqGnMm03JwNWWn5FRfiDHPzbcn550QuBiVFLI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461025; c=relaxed/simple;
	bh=SXYnJY3tF2IxRxhHTDWj07W6KylW2BVbk6ji61yvPSE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=sYqarWxHZGP3D+2wB2XK0rg2hO4k6oDrWrwlvsRylYcAaU12hVgIfxbkAcNGK7ws97JPNGwVjXFyGxy9VMAHZHgtEI6+JV3C1LhJUuYAKc74YeNSbrSz1ADpXjdYJSc+yyfZkks64L2pWPBRlfMvk5tv+3zej7gq7uZLFC5EsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvnJ95jt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvnJ95jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746461024; x=1777997024;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=SXYnJY3tF2IxRxhHTDWj07W6KylW2BVbk6ji61yvPSE=;
  b=lvnJ95jtP2LAf4xK1afXjhLnP983kwUVy9PW4MLRBy3oPdwyrc7yMroL
   FEe4Zin9ZQHHvWTuOwd8OoZ9Db3/MMrw61nT5kYrbr1EBJ+iHpfRx6R8F
   F6kd7JH+aNgwUs0WIsAiI9b4iq4s+RlBZ7SnvKG7eMUQdoSXQmuKVzprr
   HdZviiB/3g6LbcWNXIx4x9bX/DPNfFgDcXrhRKTIjHuAGED4miSeWr7hG
   G7q226dT3kUo0AFBD9gCC5J32IJia5yVN5DnVwBhrAL3VEfYrHFd5xkCg
   fFwDVYtCyTypy8jBvm7P/2OlHBNnE+GYdI+5BxLcS+STqcJwbJIQ7eDnA
   A==;
X-CSE-ConnectionGUID: 74WuIhk5SO6h65RQeskjgQ==
X-CSE-MsgGUID: dg1GYtCyQV2yIn92Pwhe5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47959117"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="47959117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 09:03:43 -0700
X-CSE-ConnectionGUID: /k34KCj1QaC25Fpa9l6MQA==
X-CSE-MsgGUID: gn5yZSNkSGODl/OHnFTFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="139305935"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO [10.124.221.35]) ([10.124.221.35])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 09:03:41 -0700
Content-Type: multipart/mixed; boundary="------------isusE2RpYvzDXBbMOK0gUjbC"
Message-ID: <13dc0d80-5d7f-40ce-be82-8d0f3eb24a1a@intel.com>
Date: Mon, 5 May 2025 09:03:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/sev: Allocate request in TSC_INFO_REQ on stack
To: Alexey Kardashevskiy <aik@amd.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>,
 Ard Biesheuvel <ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Liam Merwick <liam.merwick@oracle.com>
References: <20250505141238.4179623-1-aik@amd.com>
 <20250505141238.4179623-3-aik@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250505141238.4179623-3-aik@amd.com>

This is a multi-part message in MIME format.
--------------isusE2RpYvzDXBbMOK0gUjbC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 07:12, Alexey Kardashevskiy wrote:
> Allocate a 88 byte request structure on stack and skip needless
> kzalloc/kfree.

Could you maybe take a closer look at _all_ of these rather than poking
at them one at a time?

snp_guest_request_ioctl, for example, looks to be ~32 bytes. Why fix
'struct snp_guest_req' and leave an even worse offender?

Or, maybe just be done with it and convert them all over to __free().
Yeah, some of them don't need to be kmalloc(), but kmalloc()s are cheap
and consistency is nice, like in the attached patch.

It also wouldn't be awful to mix stack and kmalloc() allocations,
especially when the freeing semantics are the same for stack and
__free()-annotated allocations.

But it would be really nice to completely eliminate the goto mess.
--------------isusE2RpYvzDXBbMOK0gUjbC
Content-Type: text/x-patch; charset=UTF-8;
 name="snp_get_tsc_info-__free.patch"
Content-Disposition: attachment; filename="snp_get_tsc_info-__free.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2NvY28vc2V2L2NvcmUuYyBiL2FyY2gveDg2L2NvY28v
c2V2L2NvcmUuYwppbmRleCBiMGMxYTdhNTc0OTcuLjYxOGVhYWUxOTBlMiAxMDA2NDQKLS0t
IGEvYXJjaC94ODYvY29jby9zZXYvY29yZS5jCisrKyBiL2FyY2gveDg2L2NvY28vc2V2L2Nv
cmUuYwpAQCAtMzE3NCw0MSArMzE3NCwzMiBAQCBFWFBPUlRfU1lNQk9MX0dQTChzbnBfc2Vu
ZF9ndWVzdF9yZXF1ZXN0KTsKIAogc3RhdGljIGludCBfX2luaXQgc25wX2dldF90c2NfaW5m
byh2b2lkKQogewotCXN0cnVjdCBzbnBfZ3Vlc3RfcmVxdWVzdF9pb2N0bCAqcmlvOwotCXN0
cnVjdCBzbnBfdHNjX2luZm9fcmVzcCAqdHNjX3Jlc3A7Ci0Jc3RydWN0IHNucF90c2NfaW5m
b19yZXEgKnRzY19yZXE7Ci0Jc3RydWN0IHNucF9tc2dfZGVzYyAqbWRlc2M7Ci0Jc3RydWN0
IHNucF9ndWVzdF9yZXEgKnJlcTsKKwlzdHJ1Y3Qgc25wX2d1ZXN0X3JlcXVlc3RfaW9jdGwg
KnJpbyBfX2ZyZWUoa2ZyZWUpID0gTlVMTDsKKwlzdHJ1Y3Qgc25wX3RzY19pbmZvX3Jlc3Ag
KnRzY19yZXNwICBfX2ZyZWUoa2ZyZWVfc2Vuc2l0aXZlKSA9IE5VTEw7CisJc3RydWN0IHNu
cF90c2NfaW5mb19yZXEgKnRzY19yZXEgICAgX19mcmVlKGtmcmVlKSA9IE5VTEw7CisJc3Ry
dWN0IHNucF9ndWVzdF9yZXEgKnJlcQkgICAgX19mcmVlKGtmcmVlKSA9IE5VTEw7CisJc3Ry
dWN0IHNucF9tc2dfZGVzYyAqbWRlc2MJICAgIF9fZnJlZShzbnBfbXNnX2ZyZWUpID0gTlVM
TDsKIAlpbnQgcmMgPSAtRU5PTUVNOwogCi0JdHNjX3JlcSA9IGt6YWxsb2Moc2l6ZW9mKCp0
c2NfcmVxKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCF0c2NfcmVxKQotCQlyZXR1cm4gcmM7Ci0K
IAkvKgogCSAqIFRoZSBpbnRlcm1lZGlhdGUgcmVzcG9uc2UgYnVmZmVyIGlzIHVzZWQgd2hp
bGUgZGVjcnlwdGluZyB0aGUKIAkgKiByZXNwb25zZSBwYXlsb2FkLiBNYWtlIHN1cmUgdGhh
dCBpdCBoYXMgZW5vdWdoIHNwYWNlIHRvIGNvdmVyCiAJICogdGhlIGF1dGh0YWcuCiAJICov
CiAJdHNjX3Jlc3AgPSBremFsbG9jKHNpemVvZigqdHNjX3Jlc3ApICsgQVVUSFRBR19MRU4s
IEdGUF9LRVJORUwpOwotCWlmICghdHNjX3Jlc3ApCi0JCWdvdG8gZV9mcmVlX3RzY19yZXE7
Ci0KKwl0c2NfcmVxID0ga3phbGxvYyhzaXplb2YoKnRzY19yZXEpLCBHRlBfS0VSTkVMKTsK
IAlyZXEgPSBremFsbG9jKHNpemVvZigqcmVxKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFyZXEp
Ci0JCWdvdG8gZV9mcmVlX3RzY19yZXNwOwotCiAJcmlvID0ga3phbGxvYyhzaXplb2YoKnJp
byksIEdGUF9LRVJORUwpOwotCWlmICghcmlvKQotCQlnb3RvIGVfZnJlZV9yZXE7CisJaWYg
KCEodHNjX3Jlc3AgJiYgdHNjX3JlcSAmJiByZXEgJiYgcmlvKSkKKwkJcmV0dXJuIHJjOwog
CiAJbWRlc2MgPSBzbnBfbXNnX2FsbG9jKCk7CiAJaWYgKElTX0VSUl9PUl9OVUxMKG1kZXNj
KSkKLQkJZ290byBlX2ZyZWVfcmlvOworCQlyZXR1cm4gcmM7CiAKIAlyYyA9IHNucF9tc2df
aW5pdChtZGVzYywgc25wX3ZtcGwpOwogCWlmIChyYykKLQkJZ290byBlX2ZyZWVfbWRlc2M7
CisJCXJldHVybiByYzsKIAogCXJlcS0+bXNnX3ZlcnNpb24gPSBNU0dfSERSX1ZFUjsKIAly
ZXEtPm1zZ190eXBlID0gU05QX01TR19UU0NfSU5GT19SRVE7CkBAIC0zMjIxLDcgKzMyMTIs
NyBAQCBzdGF0aWMgaW50IF9faW5pdCBzbnBfZ2V0X3RzY19pbmZvKHZvaWQpCiAKIAlyYyA9
IHNucF9zZW5kX2d1ZXN0X3JlcXVlc3QobWRlc2MsIHJlcSwgcmlvKTsKIAlpZiAocmMpCi0J
CWdvdG8gZV9yZXF1ZXN0OworCQlyZXR1cm4gcmM7CiAKIAlwcl9kZWJ1ZygiJXM6IHJlc3Bv
bnNlIHN0YXR1cyAweCV4IHNjYWxlIDB4JWxseCBvZmZzZXQgMHglbGx4IGZhY3RvciAweCV4
XG4iLAogCQkgX19mdW5jX18sIHRzY19yZXNwLT5zdGF0dXMsIHRzY19yZXNwLT50c2Nfc2Nh
bGUsIHRzY19yZXNwLT50c2Nfb2Zmc2V0LApAQCAtMzIzNSwyMCArMzIyNiw2IEBAIHN0YXRp
YyBpbnQgX19pbml0IHNucF9nZXRfdHNjX2luZm8odm9pZCkKIAkJcmMgPSAtRUlPOwogCX0K
IAotZV9yZXF1ZXN0OgotCS8qIFRoZSByZXNwb25zZSBidWZmZXIgY29udGFpbnMgc2Vuc2l0
aXZlIGRhdGEsIGV4cGxpY2l0bHkgY2xlYXIgaXQuICovCi0JbWVtemVyb19leHBsaWNpdCh0
c2NfcmVzcCwgc2l6ZW9mKCp0c2NfcmVzcCkgKyBBVVRIVEFHX0xFTik7Ci1lX2ZyZWVfbWRl
c2M6Ci0Jc25wX21zZ19mcmVlKG1kZXNjKTsKLWVfZnJlZV9yaW86Ci0Ja2ZyZWUocmlvKTsK
LWVfZnJlZV9yZXE6Ci0Ja2ZyZWUocmVxKTsKLSBlX2ZyZWVfdHNjX3Jlc3A6Ci0Ja2ZyZWUo
dHNjX3Jlc3ApOwotZV9mcmVlX3RzY19yZXE6Ci0Ja2ZyZWUodHNjX3JlcSk7Ci0KIAlyZXR1
cm4gcmM7CiB9CiAK

--------------isusE2RpYvzDXBbMOK0gUjbC--
