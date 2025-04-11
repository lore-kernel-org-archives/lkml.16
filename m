Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A73929008D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361641; cv=none; b=o9WG0TF+iwKuJHeHkIs1/FezLMN3K58UXBirlIS/7K5cpD1Zvc+GX9J8mdCNys2IYX09naSvI0iIy5yi3YkN7/HipVmsLtFlPe7G6xrmb+r00mgR1e0a7OBAa1iUJPoZCYVNA/+6LQyDLhg2jBeNuq9plWpC2kA7VOVI4lbqkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361641; c=relaxed/simple;
	bh=k0e87+8OGPQmaFWxAfBs/XQk7xPQcTlDXk5MeAbKx+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sA2ZtGl/5eduEIxQbHaVNOIJOyeCMkeIuNYwWJDoqffGw9mUfBFLLZYu0Ri+KdQskDik/0CUrEpaf8ecSVa3LCnmB6TYFsfOV3alEWC3mYPQ7qmDC0ZPsK1zT44z1wFcZJYjUo4EarvJiff9PlcmHkKeBboHlRW69kAzyzuJChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZLgviyZF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZLgviyZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744361638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k0e87+8OGPQmaFWxAfBs/XQk7xPQcTlDXk5MeAbKx+A=;
	b=ZLgviyZFiuP6z5NZT0pV4Lk7HCtukfuGyFPFtlt27ueyrdvcFRAbNhcWlvmOWDYqfRIzaT
	AJQ7ksoWY2ER1o3W+iMA4JdRuXPUe7sUrDUblyYsaS3W0sYKWdc9wH7RHkKdeweZaH8RZU
	XZ3KwW9wXS7yNaNmKWCn9HMo8sAWQaY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-jhYZ3EC_PE27orgvc5wuFg-1; Fri, 11 Apr 2025 04:53:57 -0400
X-MC-Unique: jhYZ3EC_PE27orgvc5wuFg-1
X-Mimecast-MFC-AGG-ID: jhYZ3EC_PE27orgvc5wuFg_1744361636
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39134c762ebso761809f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361636; x=1744966436;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0e87+8OGPQmaFWxAfBs/XQk7xPQcTlDXk5MeAbKx+A=;
        b=hbc7qM/49wKOY6J6AkwIWxGCwQdj76nb1oRKYRC/B3Ft4c3HBFnafwLJhJ43FOAHrF
         +gOoFUoGr8sE4yZ3D4NWtGK5CIX5TAYfyt3fBAqfsmLYVEGRW52P32KDrt3uCSKnbOpf
         XC059NCp7IFDxR3AUsesHFhURZmgROtJd27wsS2DdEX2KIJzNEoiOwC9LHGpBpNZROEt
         Fj37sXbVQ0YHy27aYBnVMO56sIwRPKm2XEoXOCIx7WLlEjIvjcgJsyJRoYoDt11Srn09
         2IJhcunDGt2kVRCKkfSokPU7wegi/NeCDZIg8w80M/3m2Ws4SXevP39UxD8MI793u8bs
         Pkfw==
X-Forwarded-Encrypted: i=1; AJvYcCW1fHe5/45H34/Mxi76pThZiIIF8S8lXyFLad+qFOw+IJl6PH9k63Uag4rPAjheX17RV4pLbuRXWK9fzWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvrNs+z3NcXqJIyUIkRLc0v3jgzklp2fu61LBW/QTlaBa3eNoM
	0VKmge3JsiJnEyfX6BsaOnTRl0KScQWSdKUMgcHkaLNF9ySuEp1Nj3D6/EIMdjmFRYA61z12ufm
	nO6QTHo7yXukYapuhnrJyOH5ZajepvwtbeMUQ13/a3sBCtd/TRHtzlDgLbhO6Sg==
X-Gm-Gg: ASbGncs1iYzpzaFXgUB7mvt49MhOijGuo+aiAGMgSlzKJBsD9MT8SlWeV4hZOBCxmid
	BjPPp1BkAy45Is/B/ufgVoFfdfBi5gKwkW+qt9xe7uBvdNqa6urk8+O+HSnCKTl4vRfhl0fhB9A
	9nW3+hELQaLczCipq9g02t+uCsRHZXeKTYLbUDM6ntPfomgVfnaM76JsrcSTeZXI9DnAAPSw7I/
	hNsO6MBLrLIsN8u915/4j6Pvv7xDwjnpWFpsI7NOSNXgQxwcT1OcIrprfBx2rtCrS8XA3Pa6jIo
	Zca2yqBV6Hm3QJ2vqcsG1o71+t2RFr1vFek4EQ==
X-Received: by 2002:a05:6000:1863:b0:391:952:c728 with SMTP id ffacd0b85a97d-39ea51d2ef2mr1307054f8f.4.1744361636073;
        Fri, 11 Apr 2025 01:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZHH2qTSDheGEe1uWpBsnE3Tq6ugbYEaivo2aQTNOcuG05nQHeLEfmSnMJN6OnPKr9PgpSTw==
X-Received: by 2002:a05:6000:1863:b0:391:952:c728 with SMTP id ffacd0b85a97d-39ea51d2ef2mr1307034f8f.4.1744361635759;
        Fri, 11 Apr 2025 01:53:55 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cfdbsm1342657f8f.40.2025.04.11.01.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:53:55 -0700 (PDT)
Message-ID: <16410f1680d27424869f0aa642ef41ae9647bd40.camel@redhat.com>
Subject: Re: [PATCH v2 06/22] verification/dot2k: Remove __buff_to_string()
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Fri, 11 Apr 2025 10:53:52 +0200
In-Reply-To: <5e50fa5438830238d92c037c6e609db104503584.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <5e50fa5438830238d92c037c6e609db104503584.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gRnJpLCAyMDI1LTA0LTExIGF0IDA5OjM3ICswMjAwLCBOYW0gQ2FvIHdyb3RlOgo+IHN0ci5q
b2luKCkgY2FuIGRvIHdoYXQgX19idWZmX3RvX3N0cmluZygpIGRvZXMuIFRoZXJlZm9yZSByZXBs
YWNlCj4gX19idWZmX3RvX3N0cmluZygpIHRvIG1ha2UgdGhlIHNjcmlwdHMgbW9yZSBweXRob25p
Yy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxuYW1jYW9AbGludXRyb25peC5kZT4KPiAt
LS0KPiDCoHRvb2xzL3ZlcmlmaWNhdGlvbi9kb3QyL2RvdDIvZG90MmsucHkgfCAyMSArKysrKyst
LS0tLS0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE1IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy92ZXJpZmljYXRpb24vZG90Mi9kb3Qy
L2RvdDJrLnB5Cj4gYi90b29scy92ZXJpZmljYXRpb24vZG90Mi9kb3QyL2RvdDJrLnB5Cj4gaW5k
ZXggZGQ0YjU1MjhhNGYyLi4wOTIyNzU0NDU0YjkgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdmVyaWZp
Y2F0aW9uL2RvdDIvZG90Mi9kb3Qyay5weQo+ICsrKyBiL3Rvb2xzL3ZlcmlmaWNhdGlvbi9kb3Qy
L2RvdDIvZG90MmsucHkKPiBAQCAtMTA5LDE1ICsxMDksNiBAQCBjbGFzcyBkb3QyayhEb3QyYyk6
Cj4gwqDCoMKgwqDCoMKgwqDCoCBmZC5jbG9zZSgpCj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
Y29udGVudAo+IMKgCj4gLcKgwqDCoCBkZWYgX19idWZmX3RvX3N0cmluZyhzZWxmLCBidWZmKToK
PiAtwqDCoMKgwqDCoMKgwqAgc3RyaW5nID0gIiIKPiAtCj4gLcKgwqDCoMKgwqDCoMKgIGZvciBs
aW5lIGluIGJ1ZmY6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RyaW5nID0gc3RyaW5nICsg
bGluZSArICJcbiIKPiAtCj4gLcKgwqDCoMKgwqDCoMKgICMgY3V0IG9mZiB0aGUgbGFzdCBcbgo+
IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gc3RyaW5nWzotMV0KPiAtCj4gwqDCoMKgwqAgZGVmIGZp
bGxfbW9uaXRvcl90eXBlKHNlbGYpOgo+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHNlbGYubW9u
aXRvcl90eXBlLnVwcGVyKCkKPiDCoAo+IEBAIC0xNDgsMTkgKzEzOSwxOSBAQCBjbGFzcyBkb3Qy
ayhEb3QyYyk6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmZi5hcHBlbmQo
Ilx0ZGFfJXNfJXMoJXMlcyk7IiAlIChoYW5kbGUsCj4gc2VsZi5uYW1lLCBldmVudCwgc2VsZi5l
bnVtX3N1ZmZpeCkpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBidWZmLmFwcGVuZCgifSIp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZmYuYXBwZW5kKCIiKQo+IC3CoMKgwqDCoMKg
wqDCoCByZXR1cm4gc2VsZi5fX2J1ZmZfdG9fc3RyaW5nKGJ1ZmYpCj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiAnXG4nLmpvaW4oYnVmZikKPiDCoAo+IMKgwqDCoMKgIGRlZiBmaWxsX3RyYWNlcG9p
bnRfYXR0YWNoX3Byb2JlKHNlbGYpOgo+IMKgwqDCoMKgwqDCoMKgwqAgYnVmZiA9IFtdCj4gwqDC
oMKgwqDCoMKgwqDCoCBmb3IgZXZlbnQgaW4gc2VsZi5ldmVudHM6Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJ1ZmYuYXBwZW5kKCJcdHJ2X2F0dGFjaF90cmFjZV9wcm9iZShcIiVzXCIsIC8q
IFhYWDoKPiB0cmFjZXBvaW50ICovLCBoYW5kbGVfJXMpOyIgJSAoc2VsZi5uYW1lLCBldmVudCkp
Cj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBzZWxmLl9fYnVmZl90b19zdHJpbmcoYnVmZikKPiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuICdcbicuam9pbihidWZmKQo+IMKgCj4gwqDCoMKgwqAgZGVm
IGZpbGxfdHJhY2Vwb2ludF9kZXRhY2hfaGVscGVyKHNlbGYpOgo+IMKgwqDCoMKgwqDCoMKgwqAg
YnVmZiA9IFtdCj4gwqDCoMKgwqDCoMKgwqDCoCBmb3IgZXZlbnQgaW4gc2VsZi5ldmVudHM6Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZmYuYXBwZW5kKCJcdHJ2X2RldGFjaF90cmFjZV9w
cm9iZShcIiVzXCIsIC8qIFhYWDoKPiB0cmFjZXBvaW50ICovLCBoYW5kbGVfJXMpOyIgJSAoc2Vs
Zi5uYW1lLCBldmVudCkpCj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBzZWxmLl9fYnVmZl90b19z
dHJpbmcoYnVmZikKPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuICdcbicuam9pbihidWZmKQo+IMKg
Cj4gwqDCoMKgwqAgZGVmIGZpbGxfbWFpbl9jKHNlbGYpOgo+IMKgwqDCoMKgwqDCoMKgwqAgbWFp
bl9jID0gc2VsZi5tYWluX2MKPiBAQCAtMjEwLDcgKzIwMSw3IEBAIGNsYXNzIGRvdDJrKERvdDJj
KToKPiDCoMKgwqDCoMKgwqDCoMKgIGJ1ZmYgPSBzZWxmLmZpbGxfbW9kZWxfaF9oZWFkZXIoKQo+
IMKgwqDCoMKgwqDCoMKgwqAgYnVmZiArPSBzZWxmLmZvcm1hdF9tb2RlbCgpCj4gwqAKPiAtwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHNlbGYuX19idWZmX3RvX3N0cmluZyhidWZmKQo+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gJ1xuJy5qb2luKGJ1ZmYpCj4gwqAKPiDCoMKgwqDCoCBkZWYgZmlsbF9t
b25pdG9yX2NsYXNzX3R5cGUoc2VsZik6Cj4gwqDCoMKgwqDCoMKgwqDCoCBpZiBzZWxmLm1vbml0
b3JfdHlwZSA9PSAicGVyX3Rhc2siOgo+IEBAIC0yNDIsNyArMjMzLDcgQEAgY2xhc3MgZG90Mmso
RG90MmMpOgo+IMKgwqDCoMKgwqDCoMKgwqAgdHBfYXJnc19jID0gIiwgIi5qb2luKFtiIGZvciBh
LGIgaW4gdHBfYXJnc10pCj4gwqDCoMKgwqDCoMKgwqDCoCBidWZmLmFwcGVuZCgiCcKgwqDCoMKg
IFRQX1BST1RPKCVzKSwiICUgdHBfcHJvdG9fYykKPiDCoMKgwqDCoMKgwqDCoMKgIGJ1ZmYuYXBw
ZW5kKCIJwqDCoMKgwqAgVFBfQVJHUyglcykiICUgdHBfYXJnc19jKQo+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gc2VsZi5fX2J1ZmZfdG9fc3RyaW5nKGJ1ZmYpCj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiAnXG4nLmpvaW4oYnVmZikKPiDCoAo+IMKgwqDCoMKgIGRlZiBmaWxsX21vbml0b3JfZGVw
cyhzZWxmKToKPiDCoMKgwqDCoMKgwqDCoMKgIGJ1ZmYgPSBbXQo+IEBAIC0yNTAsNyArMjQxLDcg
QEAgY2xhc3MgZG90MmsoRG90MmMpOgo+IMKgwqDCoMKgwqDCoMKgwqAgaWYgc2VsZi5wYXJlbnQ6
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZmYuYXBwZW5kKCIJZGVwZW5kcyBvbiBSVl9N
T05fJXMiICUKPiBzZWxmLnBhcmVudC51cHBlcigpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBidWZmLmFwcGVuZCgiCWRlZmF1bHQgeSIpCj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBzZWxm
Ll9fYnVmZl90b19zdHJpbmcoYnVmZikKPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuICdcbicuam9p
bihidWZmKQo+IMKgCj4gwqDCoMKgwqAgZGVmIGZpbGxfdHJhY2VfaChzZWxmKToKPiDCoMKgwqDC
oMKgwqDCoMKgIHRyYWNlX2ggPSBzZWxmLnRyYWNlX2gKCkdvb2Qgb25lLCBJJ3ZlIGJlZW4gdG9v
IGxhenkgdG8gZG8gaXQuIFRoYW5rcyEKClJldmlld2VkLWJ5OiBHYWJyaWVsZSBNb25hY28gPGdt
b25hY29AcmVkaGF0LmNvbT4K

