Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458241B043A;
	Fri, 30 May 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598822; cv=none; b=AsCp2hy8Ie8Mp8UrwYaw440ozNVo8D38hdX2DU17BFvfxnd54J37T3uTHyg+NEI52eeLJvwU/KbtHeotBV++fnQjWr+6R6tqVN+TQ0dGapoz+C4I2fYkwoCkyB9ZiSl06YldYdM/BQGoa6xF4EDQFOdwQIiAZpJ5jVst6NtWMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598822; c=relaxed/simple;
	bh=TD+1ST3M5xSauEs2Spbc5a1MZI9ewjrcYLqE+eo/fxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP/lBZa53BgaUNP4D1NkfjHiTnSRwf4mi+Ut0KAALzEbPQ1MqkU3zn8x+GJwhsFo78ZpIHofvRStMD/2l60RyDRI8H2VtrxX1ZRvxu4stLf71bugb+4kZ2U9W5rgJ72d1WBf5NKWr2qTwF9vwR/HiHr7G0rfMMx86X1rBf+MULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoYjykIL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoYjykIL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3087a70557bso242423a91.2;
        Fri, 30 May 2025 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748598820; x=1749203620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TD+1ST3M5xSauEs2Spbc5a1MZI9ewjrcYLqE+eo/fxI=;
        b=ZoYjykILNIZtK/qrIKhERD5HV2dWUkEsjSSEdX6rAvwpgKkMSr7kFIXOCSEt9KJSVm
         ryuh83wo7YCfb26mv2u2FfbSUX7rFqDnuQQlp8Tfvigk3e14A8Rv2knOFB/ht4hd9HTB
         i3lbyeNhOrVjnbp1iDVBPGEERq0QR0KJ6uqqRp1jfEcSNyMt+cpdnEzJlzz0jz4ZHO68
         d4PmzJ7jQ/IdS86kbl+ekHyWy5BLKRExFOCZn39nB2OyqWl8KicNrRX5PUHmdqdY64oJ
         0+GpaYjyf8j2tGCSmE9JtvqI2DYaiaxvtelJhO1DESYT0GYg2TOLaV2grdyasH1OiIyz
         Z92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598820; x=1749203620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD+1ST3M5xSauEs2Spbc5a1MZI9ewjrcYLqE+eo/fxI=;
        b=W5AizOdSi9UEhzgYSR29sY3Fjpk3f+j3QU1nLJV8z7cMNogkNKJDs+nhfcOezYBXr7
         cReimZUxpJIxP3o4WY8fjCG5tGNdOwa7IwWV8jA8U4SZHy5Be08VLj0kOBLo3PnLIjH6
         djTs4YxiokY2hGPdtO6J4frIBtUu6r04UP0pqP8uQtSjtrp836sxG4Si8g/9lrHjdRcI
         FWpVR3CW5QPEHLI/KTSez5HCVHaTg2r1pwriGWL8At94kO5GbBcNRT2Ta9NdIByIIg+E
         Hyq1oukwQ3k2njN2pKN4DTqnNO+ArH6i9hxJn8d/QrzhKnECdy47VS9BkHzX6t91Es2c
         R06w==
X-Forwarded-Encrypted: i=1; AJvYcCWYsaualh3nSlBcAo+K1TDLckpA//X2Wp94bJ0Dg5434sLmXDpgyGTkQV1bPgUA+3W3c3wBhaO8+RtBlnxV2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YztSji2ZyQ/Url+x/lQ3/bedKNKsxmN9tSzIEs0vaXjgWgQ5CTq
	3Iu0SMgYu462C8Pjbs7HnFYoyRigZ0qns1TmqDkmpJmRrThMBCRJ6Dn4Q14+jyY9RE6M0ISl7Q8
	wweTCXnOinNV/CCelOFNOFyBrm6Ij7cQhWYCEThQ=
X-Gm-Gg: ASbGnctIUn9CKyW9XsikE2YModk1JAbq6maJy19J7KaqvG6XXd2NaHryL3/ZmKFkpga
	+P1k1dsfJGMLgFw4cuGVCDWjd3iiwyMpQVTpQhPyFO0UvDLrOM8PAhEYoSRHEMNaVDaY4RD5hA2
	vBauvz4hMZnHtrf/UFfnOb0EB/Mt2lyPEWyhW/CP447IzV6kCwQp7rxg==
X-Google-Smtp-Source: AGHT+IHCwpo8xFzMKyafm9Tzecol/jt9TIEUjhUe1GqS9XmQTT1beFLDOHH2ynysbpTutqI9xg9z2enbntD8tdfrbHY=
X-Received: by 2002:a17:90b:3d8c:b0:311:c1da:3858 with SMTP id
 98e67ed59e1d1-3124d07ed8amr1094925a91.0.1748598820444; Fri, 30 May 2025
 02:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
In-Reply-To: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 May 2025 11:53:25 +0200
X-Gm-Features: AX0GCFsqYnmkF6EIcyUfCnPuTAR45s0QAP1jOQnctRvj9DtcSS9iCeEm_K1yekQ
Message-ID: <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Rudraksha Gupta <guptarud@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: multipart/mixed; boundary="0000000000008c377c063657631c"

--0000000000008c377c063657631c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 8:23=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> Bad: next-20250530
> Good: next-20250528

Thanks Rudraksha, the diff attached was needed on merge -- Stephen
didn't hit the error in his build so he didn't apply it just in case I
think, but it should be fixed in the next tag.

(If the diff doesn't work, of course, please let us know!)

Cheers,
Miguel

--0000000000008c377c063657631c
Content-Type: application/x-patch; name="next-20250530.diff"
Content-Disposition: attachment; filename="next-20250530.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mbamhb2d0>
X-Attachment-Id: f_mbamhb2d0

ZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2RybS9kZXZpY2UucnMgYi9ydXN0L2tlcm5lbC9kcm0v
ZGV2aWNlLnJzCmluZGV4IDc0YzlhM2RkNzE5ZS4uNjI0ZDdhNGM4M2VhIDEwMDY0NAotLS0gYS9y
dXN0L2tlcm5lbC9kcm0vZGV2aWNlLnJzCisrKyBiL3J1c3Qva2VybmVsL2RybS9kZXZpY2UucnMK
QEAgLTEzNSw2ICsxMzUsOCBAQCBwdWIoY3JhdGUpIGZuIGFzX3Jhdygmc2VsZikgLT4gKm11dCBi
aW5kaW5nczo6ZHJtX2RldmljZSB7CiAgICAgLy8vCiAgICAgLy8vIGBwdHJgIG11c3QgYmUgYSB2
YWxpZCBwb2ludGVyIHRvIGEgYHN0cnVjdCBkZXZpY2VgIGVtYmVkZGVkIGluIGBTZWxmYC4KICAg
ICB1bnNhZmUgZm4gZnJvbV9kcm1fZGV2aWNlKHB0cjogKmNvbnN0IGJpbmRpbmdzOjpkcm1fZGV2
aWNlKSAtPiAqbXV0IFNlbGYgeworICAgICAgICBsZXQgcHRyOiAqY29uc3QgT3BhcXVlPGJpbmRp
bmdzOjpkcm1fZGV2aWNlPiA9IHB0ci5jYXN0KCk7CisKICAgICAgICAgLy8gU0FGRVRZOiBCeSB0
aGUgc2FmZXR5IHJlcXVpcmVtZW50cyBvZiB0aGlzIGZ1bmN0aW9uIGBwdHJgIGlzIGEgdmFsaWQg
cG9pbnRlciB0byBhCiAgICAgICAgIC8vIGBzdHJ1Y3QgZHJtX2RldmljZWAgZW1iZWRkZWQgaW4g
YFNlbGZgLgogICAgICAgICB1bnNhZmUgeyBjcmF0ZTo6Y29udGFpbmVyX29mIShwdHIsIFNlbGYs
IGRldikgfS5jYXN0X211dCgpCmRpZmYgLS1naXQgYS9ydXN0L2tlcm5lbC9kcm0vZ2VtL21vZC5y
cyBiL3J1c3Qva2VybmVsL2RybS9nZW0vbW9kLnJzCmluZGV4IDE1OTQ4MzFiMmIzOS4uNGNkNjlm
YTg0MzE4IDEwMDY0NAotLS0gYS9ydXN0L2tlcm5lbC9kcm0vZ2VtL21vZC5ycworKysgYi9ydXN0
L2tlcm5lbC9kcm0vZ2VtL21vZC5ycwpAQCAtMTI1LDYgKzEyNSw4IEBAIGZuIGFzX3Jhdygmc2Vs
ZikgLT4gKm11dCBiaW5kaW5nczo6ZHJtX2dlbV9vYmplY3QgewogICAgIH0KCiAgICAgdW5zYWZl
IGZuIGFzX3JlZjwnYT4oc2VsZl9wdHI6ICptdXQgYmluZGluZ3M6OmRybV9nZW1fb2JqZWN0KSAt
PiAmJ2EgU2VsZiB7CisgICAgICAgIGxldCBzZWxmX3B0cjogKm11dCBPcGFxdWU8YmluZGluZ3M6
OmRybV9nZW1fb2JqZWN0PiA9IHNlbGZfcHRyLmNhc3QoKTsKKwogICAgICAgICAvLyBTQUZFVFk6
IGBvYmpgIGlzIGd1YXJhbnRlZWQgdG8gYmUgaW4gYW4gYE9iamVjdDxUPmAgdmlhIHRoZSBzYWZl
dHkgY29udHJhY3Qgb2YgdGhpcwogICAgICAgICAvLyBmdW5jdGlvbgogICAgICAgICB1bnNhZmUg
eyAmKmNyYXRlOjpjb250YWluZXJfb2YhKHNlbGZfcHRyLCBPYmplY3Q8VD4sIG9iaikgfQpAQCAt
MjY5LDggKzI3MSwxMCBAQCBmbiBhc19yYXcoJnNlbGYpIC0+ICptdXQgYmluZGluZ3M6OmRybV9n
ZW1fb2JqZWN0IHsKICAgICB9CgogICAgIGV4dGVybiAiQyIgZm4gZnJlZV9jYWxsYmFjayhvYmo6
ICptdXQgYmluZGluZ3M6OmRybV9nZW1fb2JqZWN0KSB7CisgICAgICAgIGxldCBwdHI6ICptdXQg
T3BhcXVlPGJpbmRpbmdzOjpkcm1fZ2VtX29iamVjdD4gPSBvYmouY2FzdCgpOworCiAgICAgICAg
IC8vIFNBRkVUWTogQWxsIG9mIG91ciBvYmplY3RzIGFyZSBvZiB0eXBlIGBPYmplY3Q8VD5gLgot
ICAgICAgICBsZXQgdGhpcyA9IHVuc2FmZSB7IGNyYXRlOjpjb250YWluZXJfb2YhKG9iaiwgU2Vs
Ziwgb2JqKSB9OworICAgICAgICBsZXQgdGhpcyA9IHVuc2FmZSB7IGNyYXRlOjpjb250YWluZXJf
b2YhKHB0ciwgU2VsZiwgb2JqKSB9OwoKICAgICAgICAgLy8gU0FGRVRZOiBUaGUgQyBjb2RlIG9u
bHkgZXZlciBjYWxscyB0aGlzIGNhbGxiYWNrIHdpdGggYSB2YWxpZCBwb2ludGVyIHRvIGEgYHN0
cnVjdAogICAgICAgICAvLyBkcm1fZ2VtX29iamVjdGAuCg==
--0000000000008c377c063657631c--
