Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CD81E5B75
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726255; cv=none; b=mcOwNPOrVrd1wkMzpVDRrOow122tFK+32HvxNyziLpiV7CpENkyAspyo1w8Bs6Yjptjuv7/IicbQj/oHPj6S43Yk2jg9bCw7dY7rlfBX/7O7SXclFAvI2YxTCOslEzAO+wTAJKDkuPZgqP8Z2BBIdg4eUJG6UQ+vXIkf9KUl/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726255; c=relaxed/simple;
	bh=kM2JA+RWhzzict8XBtvdRvB5soS9wg7TOOfMUHS12Cc=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=BSYT6uiKDTaMMvIsI/Sxaju/DuGA0Dkwts9TflC3/yxRwnKz+X6gUdJUHlKtUB+5YyGrYkimkBqxCNN5Z2d7gx32YN168xdRHNY42R1qU1c3s6unx/ML/c0Y2XmsohJhZzKk4xaV3StYjh0EAyOBVq/km4lNnbcqWzVIHbtsVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtT1iWru; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtT1iWru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744726254; x=1776262254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=kM2JA+RWhzzict8XBtvdRvB5soS9wg7TOOfMUHS12Cc=;
  b=GtT1iWrud5ccFP7f6HZnjrP/ePpFFk1lyUfolHF7N4KSxC9qn2BC29IN
   NAo6YIdxW2MjPZ7REa+7O3hFH3YI624a5t3wMQjiBBc+fkEcheW1U3GTq
   ruMGRITu4MZCKhaZ5hTDNnzguZlCpNyusfOIosYmE0iOO6akPrcEXdNiU
   NWM1yXP1EE+d6ilY1/NzlJOeLRBrYwLoEJWAkTJdA5q9ULg34pd9jUvZ2
   zoTjOsPhONFfrvGmqAgz62tPkl5QCHyNLsJkNWttJMIrzrwFScGqp3zYJ
   NyOzxbeKnbmpVaCLcHrnJ8yPfPNJY/LG2jDYgWRJCfshhOA2h0L1FpgM6
   A==;
X-CSE-ConnectionGUID: xIaie3ueTWyu/sLEZqsFnQ==
X-CSE-MsgGUID: nzJHVPtIQvaFQH6New6Tcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56873855"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56873855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:10:49 -0700
X-CSE-ConnectionGUID: L6qIV0qTT0GhxxSv/OHmTA==
X-CSE-MsgGUID: REn++4aDS7a6Rye+Clfnwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130684603"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO [10.124.222.124]) ([10.124.222.124])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:10:48 -0700
Content-Type: multipart/mixed; boundary="------------iqGLr0HYMuisKgpweN9Z9kuH"
Message-ID: <b6c614d4-fa97-4db1-b980-47a789a9374b@intel.com>
Date: Tue, 15 Apr 2025 07:10:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/mm: Always "broadcast" PMD setting operations
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de,
 bp@alien8.de, joro@8bytes.org, luto@kernel.org, peterz@infradead.org,
 rick.p.edgecombe@intel.com, jgross@suse.com
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
 <20250414173235.F63F50D1@davehans-spike.ostc.intel.com>
 <abvsbz4yqc6xe5izuqw25hwj6y7zjhok4tdpp3kqshkuaomhn5@qnykmira2mik>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <abvsbz4yqc6xe5izuqw25hwj6y7zjhok4tdpp3kqshkuaomhn5@qnykmira2mik>

This is a multi-part message in MIME format.
--------------iqGLr0HYMuisKgpweN9Z9kuH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 01:25, Kirill A. Shutemov wrote:
>>  #ifdef CONFIG_X86_32
>> -	if (!SHARED_KERNEL_PMD) {
>> +	{
>>  		struct page *page;
>>  
>>  		list_for_each_entry(page, &pgd_list, lru) {
> Removing the condition, but leaving the block looks sloppy.
> 
> Maybe convert #ifdef to IS_ENABLED() while you are there, so it would
> justify the block?

It does, and it's right at the beginning of the function. Simplifying
the code here also made it _less_ self-documenting so it needs a better
comment too.

I'll tack the attached patch on to the end of the series.
--------------iqGLr0HYMuisKgpweN9Z9kuH
Content-Type: text/x-patch; charset=UTF-8;
 name="kill-CONFIG_X86_32-ifdef.patch"
Content-Disposition: attachment; filename="kill-CONFIG_X86_32-ifdef.patch"
Content-Transfer-Encoding: base64

ClRoaXMgYmxvY2sgb2YgY29kZSB1c2VkIHRvIGJlOgoKCWlmIChTSEFSRURfS0VSTkVMX1BN
RCkKCkJ1dCBpdCB3YXMgemFwcGVkIHdoZW4gMzItYml0IGtlcm5lbHMgdHJhbnNpdGlvbmVk
IHRvIHByaXZhdGUKKG5vbi1zaGFyZWQpIFBNRHMuIEl0IGFsc28gbWFkZSBpdCByYXRoZXIg
dW5jbGVhciB3aGF0IHRoZSBibG9jawpvZiBjb2RlIGlzIGRvaW5nIGluIHRoZSBmaXJzdCBw
bGFjZS4KClJlbW92ZSB0aGUgI2lmZGVmIGFuZCByZXBsYWNlIGl0IHdpdGggSVNfRU5BQkxF
RCgpLiBVbmluZGVudCB0aGUKY29kZSBibG9jayBhbmQgYWRkIGFuIGFjdHVhbGx5IHVzZWZ1
bCBjb21tZW50IGFib3V0IHdoYXQgaXQgaXMKZG9pbmcuCgpTdWdnZXN0ZWQtYnk6IEtpcmls
bCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbT4KCi0tLQoK
IGIvYXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYyB8ICAgNDEgKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLXB1TiBhcmNoL3g4Ni9tbS9wYXQvc2V0
X21lbW9yeS5jfmtpbGwtQ09ORklHX1g4Nl8zMi1pZmRlZiBhcmNoL3g4Ni9tbS9wYXQvc2V0
X21lbW9yeS5jCi0tLSBhL2FyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmN+a2lsbC1DT05G
SUdfWDg2XzMyLWlmZGVmCTIwMjUtMDQtMTUgMDY6NDU6MTcuNTc5NzE3MDQ3IC0wNzAwCisr
KyBiL2FyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmMJMjAyNS0wNC0xNSAwNjo1MzoyNy44
OTA3MDk0MjIgLTA3MDAKQEAgLTg4MSwzMSArODgxLDMyIEBAIHBoeXNfYWRkcl90IHNsb3df
dmlydF90b19waHlzKHZvaWQgKl9fdmkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHNsb3dfdmly
dF90b19waHlzKTsKIAotLyoKLSAqIFNldCB0aGUgbmV3IHBtZCBpbiBhbGwgdGhlIHBnZHMg
d2Uga25vdyBhYm91dDoKLSAqLwogc3RhdGljIHZvaWQgX19zZXRfcG1kX3B0ZShwdGVfdCAq
a3B0ZSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdCBwdGUpCiB7CisJc3RydWN0IHBh
Z2UgKnBhZ2U7CisKIAkvKiBjaGFuZ2UgaW5pdF9tbSAqLwogCXNldF9wdGVfYXRvbWljKGtw
dGUsIHB0ZSk7Ci0jaWZkZWYgQ09ORklHX1g4Nl8zMgotCXsKLQkJc3RydWN0IHBhZ2UgKnBh
Z2U7Ci0KLQkJbGlzdF9mb3JfZWFjaF9lbnRyeShwYWdlLCAmcGdkX2xpc3QsIGxydSkgewot
CQkJcGdkX3QgKnBnZDsKLQkJCXA0ZF90ICpwNGQ7Ci0JCQlwdWRfdCAqcHVkOwotCQkJcG1k
X3QgKnBtZDsKLQotCQkJcGdkID0gKHBnZF90ICopcGFnZV9hZGRyZXNzKHBhZ2UpICsgcGdk
X2luZGV4KGFkZHJlc3MpOwotCQkJcDRkID0gcDRkX29mZnNldChwZ2QsIGFkZHJlc3MpOwot
CQkJcHVkID0gcHVkX29mZnNldChwNGQsIGFkZHJlc3MpOwotCQkJcG1kID0gcG1kX29mZnNl
dChwdWQsIGFkZHJlc3MpOwotCQkJc2V0X3B0ZV9hdG9taWMoKHB0ZV90ICopcG1kLCBwdGUp
OwotCQl9CisKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KSkKKwkJcmV0dXJuOwor
CisJLyoKKwkgKiAzMi1iaXQgbW1fc3RydWN0cyBkb24ndCBzaGFyZSBrZXJuZWwgUE1EIHBh
Z2VzLgorCSAqIFByb3BhZ2F0ZSB0aGUgY2hhbmdlIHRvIGVhY2ggcmVsZXZhbnQgUE1EIGVu
dHJ5OgorCSAqLworCWxpc3RfZm9yX2VhY2hfZW50cnkocGFnZSwgJnBnZF9saXN0LCBscnUp
IHsKKwkJcGdkX3QgKnBnZDsKKwkJcDRkX3QgKnA0ZDsKKwkJcHVkX3QgKnB1ZDsKKwkJcG1k
X3QgKnBtZDsKKworCQlwZ2QgPSAocGdkX3QgKilwYWdlX2FkZHJlc3MocGFnZSkgKyBwZ2Rf
aW5kZXgoYWRkcmVzcyk7CisJCXA0ZCA9IHA0ZF9vZmZzZXQocGdkLCBhZGRyZXNzKTsKKwkJ
cHVkID0gcHVkX29mZnNldChwNGQsIGFkZHJlc3MpOworCQlwbWQgPSBwbWRfb2Zmc2V0KHB1
ZCwgYWRkcmVzcyk7CisJCXNldF9wdGVfYXRvbWljKChwdGVfdCAqKXBtZCwgcHRlKTsKIAl9
Ci0jZW5kaWYKIH0KIAogc3RhdGljIHBncHJvdF90IHBncHJvdF9jbGVhcl9wcm90bm9uZV9i
aXRzKHBncHJvdF90IHByb3QpCl8K

--------------iqGLr0HYMuisKgpweN9Z9kuH--
