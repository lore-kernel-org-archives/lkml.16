Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BD32701C1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745558235; cv=none; b=pDs1G/KLNmWB55G9CqgP7yknjrRbRNlE/MqDdlEm3N/bymf/8cZgAHQao7tJpBa9gsSYnONt5WQScFdXQye+9eOO0bOlauVThIN/wkkDd3v5mQblMiAmS29whM7D4EQ+erUxEXq3/hceecvYpC9cE8EDKKIrbeww9bY5zH3EomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745558235; c=relaxed/simple;
	bh=V+EBi3PtsCgptb5iprxjoeDZiz7DWru4EZs7Lr/xMJw=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=ZSCxyaqjFZB0SymRpPO1UifEAT5HzVFgZ5GmG4MDFCFV0oR3IPoywli5Aigq8tjhXE3tVetivPrFYtun/9jgRJ/PMgzkV3Wr9AOQtnfJnJdnZNwQQrLNxYSJUSlLu2aGeqYpWbx2xo69JxUyPuSo7qxNau5X7KETkgLKFkOBAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Kd+HbodA; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Kd+HbodA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:From:
	Subject; bh=V+EBi3PtsCgptb5iprxjoeDZiz7DWru4EZs7Lr/xMJw=; b=Kd+H
	bodABsWPzeL//aJukTEIBOjmCmkfjKgMP/ZR9RXwOMIwQzxjAWG6vFOJqNPIoNvx
	bznGEjoSCg+wiGtbmzwLcuue/Mp2Wiom8eMHm1UC6OVDHnhvS8j6PRo9p43dbscf
	X5iSaJRD+xy57D6sc8rNVvQlfkkeEYBCLVoUG+A=
Received: from [10.42.12.63] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAnp+ayGgtoNRKICQ--.29390S2;
	Fri, 25 Apr 2025 13:16:35 +0800 (CST)
Content-Type: multipart/mixed; boundary="------------RjLrD9rAJfpXQxeU2aAJqbqs"
Message-ID: <101587be-8db8-4b79-aa7e-bd40832eae00@163.com>
Date: Fri, 25 Apr 2025 13:16:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: suravee.suthikulpanit@amd.com
Cc: boris.ostrovsky@oracle.com, iommu@lists.linux-foundation.org,
 james.puthukattukaran@oracle.com, joao.m.martins@oracle.com,
 jon.grimm@amd.com, joro@8bytes.org, linux-kernel@vger.kernel.org,
 sean.m.osborne@oracle.com
From: leixiang <ninollx@163.com>
Subject: [PATCH] iommu/amd: Remove unnecessary break statements
X-CM-TRANSID:_____wAnp+ayGgtoNRKICQ--.29390S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Q6pUUUUU
X-CM-SenderInfo: pqlq0zlo06il2tof0z/1tbiPRo6zGgLEFX4dgAAs5

This is a multi-part message in MIME format.
--------------RjLrD9rAJfpXQxeU2aAJqbqs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


--------------RjLrD9rAJfpXQxeU2aAJqbqs
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-iommu-amd-Remove-unnecessary-break-statements.patch"
Content-Disposition: attachment;
 filename="0001-iommu-amd-Remove-unnecessary-break-statements.patch"
Content-Transfer-Encoding: base64

RnJvbSBmN2ZmMzI5OGQwNTQ3OWYzNDQ2M2I0MDllMWNiY2VjMzk2NjIxYjcxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBsZWl4aWFuZyA8bGVpeGlhbmdAa3lsaW5vcy5jbj4K
RGF0ZTogRnJpLCAyNSBBcHIgMjAyNSAxMjoxODo0MiArMDgwMApTdWJqZWN0OiBbUEFUQ0hd
IGlvbW11L2FtZDogUmVtb3ZlIHVubmVjZXNzYXJ5IGJyZWFrIHN0YXRlbWVudHMKCkFzIENN
UFhDSEcxNkIgZmVhdHVyZSBoYXMgYWxyZWFkeSBiZWVuIGNoZWNrZWQgc2VwYXJhdGVseQpi
ZWZvcmUgZW5hYmxpbmcgdGhlIEdBLCBYVCwgYW5kIEdBTSBtb2RlcywgdGhlcmUgaXMgdW5u
ZWNlc3NhcnkKbmVlZCBhIGJyZWFrIGluIGluaXRfaW9tbXVfb25lIGF0IGNhc2UgMHg0MC4K
CkZpeGVzOiBlNTJkNThkNTRhMzIxICgiaW9tbXUvYW1kOiBVc2UgY21weGNoZ19kb3VibGUo
KSB3aGVuIHVwZGF0aW5nIDEyOC1iaXQgSVJURSIpClNpZ25lZC1vZmYtYnk6IGxlaXhpYW5n
IDxsZWl4aWFuZ0BreWxpbm9zLmNuPgotLS0KIGRyaXZlcnMvaW9tbXUvYW1kL2luaXQuYyB8
IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvYW1kL2luaXQuYyBiL2RyaXZlcnMvaW9t
bXUvYW1kL2luaXQuYwppbmRleCBkZDllMjZiN2I3MTguLjVmYjVhNGQ3YzE0MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9pb21tdS9hbWQvaW5pdC5jCisrKyBiL2RyaXZlcnMvaW9tbXUvYW1k
L2luaXQuYwpAQCAtMTc5MCwxMCArMTc5MCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRf
aW9tbXVfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCBzdHJ1Y3QgaXZoZF9oZWFkZXIg
KmgsCiAJCQlpb21tdS0+bW1pb19waHlzX2VuZCA9IE1NSU9fQ05UUl9DT05GX09GRlNFVDsK
IAogCQkvKiBYVCBhbmQgR0FNIHJlcXVpcmUgR0EgbW9kZS4gKi8KLQkJaWYgKChoLT5lZnJf
cmVnICYgKDB4MSA8PCBJT01NVV9FRlJfR0FTVVBfU0hJRlQpKSA9PSAwKSB7CisJCWlmICgo
aC0+ZWZyX3JlZyAmICgweDEgPDwgSU9NTVVfRUZSX0dBU1VQX1NISUZUKSkgPT0gMCkKIAkJ
CWFtZF9pb21tdV9ndWVzdF9pciA9IEFNRF9JT01NVV9HVUVTVF9JUl9MRUdBQ1k7Ci0JCQli
cmVhazsKLQkJfQogCiAJCWlmIChoLT5lZnJfcmVnICYgQklUKElPTU1VX0VGUl9YVFNVUF9T
SElGVCkpCiAJCQlhbWRfaW9tbXVfeHRfbW9kZSA9IElSUV9SRU1BUF9YMkFQSUNfTU9ERTsK
LS0gCjIuNDMuMAoK

--------------RjLrD9rAJfpXQxeU2aAJqbqs--

