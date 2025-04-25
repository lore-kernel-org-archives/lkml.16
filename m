Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867A635;
	Fri, 25 Apr 2025 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567311; cv=none; b=jGOHHi16n07Bsx1Gipe7fJ3rxmTSRwvKmKQ+/GjWP4rIYWvKqfKRgEJpWR+MS2WoUOl+EMH8xxiDRE+hP7a0Ia3neRqfBiwwN5255HVJoqzGbu3RLy174DwyCY+T8vHHEsxJRmMkS5kfLzHZPHBI9cGZHbHLQ2FIQKlQXSoX3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567311; c=relaxed/simple;
	bh=zvROqqW/hGYLAda6coa5l3csmnOKz0oBQDkt3WNw2KE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=irq1wdnkA7dg8deJOgJg57kDKocciVGSOToqqvONbNSp6jeK3KGmxXv7AFGwHFb/8cT8c312X9sfOQab0qTknBbnzoamfVFnqzsGrFAwaTaeDW8kpaauiHOZK49VFbmowo+qe7dUACPk/YhmRkw/s/bU6sze3OgS8mMZJyfZP24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGpvHpBz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGpvHpBz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224341bbc1dso24319855ad.3;
        Fri, 25 Apr 2025 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745567309; x=1746172109; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zvROqqW/hGYLAda6coa5l3csmnOKz0oBQDkt3WNw2KE=;
        b=NGpvHpBzOBvzis++HGhFecFH/YMieJlvlnkrscN6gFC5YrseabsD6mEgOFJO1z6mJ/
         dmhZOecDC7OISNEq7nAOXeynxWErawc36lC8IuZZOA9LLolo9vCoSlpwLu/3eNFwnVds
         Z5KWsi2u/8tOIqpdIRDovqkOoqXLMVIQWxvcnwGHzqxjRYqTrTrAAxzv3TQWCz3oHPIZ
         eI++Paq540CbNFxxHj2r8J5mivDI9cNfUVn9CaT8bPRUxiCAR0D/PV6vhce6Q+3Yd6Bg
         o537LzmKCRVJSwRvY1BNVBAcgy8wxlQXPOzZmD1V3vVOYoJVW8x4oaGQCmoTRofH3jx5
         BL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567309; x=1746172109;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvROqqW/hGYLAda6coa5l3csmnOKz0oBQDkt3WNw2KE=;
        b=Q7cKPhGOPOhX76gfA8KdVVr0LdYCnP08szQ1P7x9Ymu+s1GJ5OPLzTKnUWNkZMtzOp
         tAP+L1lLrz1/thFcU+UkaPHy8+AEFi5V+WHDih7Ybxs9wimLIxLcciY4etGSMbi/+135
         vcbcW3msl2uML5Z7ag1FfFooacE6s6mfGOyfOThjNAveCp6BejL6fl0E02mItebHje9z
         /ArIgcJGY4mtR5d2No9hXTnxA06/5hZ6RHEdd52StPdFUHJD6P3rw0AE8U1rFcMz1dqw
         hu2Rjymjwjoekj+mlC4W3YvxREPccET98vvYOn3o6X3F6SPOLUgU4+IFoRqBSCEuu8Y1
         j/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUmw5F5jnAV9Snpubmi5Lu7A8kdP3wdh93BwMqxHU9Oh98/WBeNXOKnXWto/jwvODCyo/2XTbfZ3MQLmMk=@vger.kernel.org, AJvYcCWa6dk+l9NH5EEtxfo3swhDLgCaJXrI2aQHTaTuiwN/vYDJCbZynqqaEeasmDx8POPgvb92C1GA5K49kGG3LhfW4tQ7yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbaj6C7H8/znwaFNJfyKP3cZyDggTRAgzZb7r3SzqgMY0d1lHZ
	452pF/FJcuW0rUiZC1ovgoZI1dahVf4TNYq5w4jtF41hNMgm01Co
X-Gm-Gg: ASbGncsaoouROdTigEm2UWreM1DJZ2Q+i5sqgOlqRNkPfjvGuifHcRojIv2NKZhEMly
	eGgG3c+KvjdP6VKxefOnqhGjoaUy24zxlVD63cbrTiQr6G0+bd9yKQ6lL8bqCby1R0qNVxjjzfo
	PlGR/Z7uU9MrvGU4/sBJsfPTemFgzXnH+fm+rP+tic/HQEpXhkY65hyKzNsE+BWHvFTSj/8/UXk
	T1JtAqrKs/dj6NZuqXmVwtNa1rlI+tdGQ8JTi3nitzYG/UpJvmePKncuVoQyeObUqf2jG3FGPZu
	Nb7+tJInRGThbW5ms72uYujkBvcD+0g0+5dJvqH4L3qN
X-Google-Smtp-Source: AGHT+IFPWyzkWOkXov2+l5hWl040baQNquu+YJe/G0PAa4ShENTmQJnUixcisPZ5NKOYdXWV/6OsJg==
X-Received: by 2002:a17:903:1b04:b0:224:1943:c65 with SMTP id d9443c01a7336-22dbf5ea798mr21441685ad.14.1745567308632;
        Fri, 25 Apr 2025 00:48:28 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c8dsm25818965ad.259.2025.04.25.00.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 00:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f8e0df50e0ac3106afbb77cd0b2f1ff19fa0e94c42b5b04d376b20835a2c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 25 Apr 2025 04:48:13 -0300
Message-Id: <D9FJYO87PWNU.1296TXH1IPP66@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hdegoede@redhat.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyndon Sanche"
 <lsanche@lyndeno.ca>, "Mario Limonciello" <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
 <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
 <D9E5H5B9X448.12FJT48775C50@gmail.com>
 <3ae149b5-a936-45b4-8887-eb7cde1ee4b0@redhat.com>
 <310fae71-d3b7-51b8-6012-c73b2ba7e282@linux.intel.com>
In-Reply-To: <310fae71-d3b7-51b8-6012-c73b2ba7e282@linux.intel.com>

--f8e0df50e0ac3106afbb77cd0b2f1ff19fa0e94c42b5b04d376b20835a2c
Content-Type: multipart/mixed;
 boundary=b693a78c1fa53d64a99935a3c67a40a2d8abb52fbfad6c290c4c0585accc

--b693a78c1fa53d64a99935a3c67a40a2d8abb52fbfad6c290c4c0585accc
Content-Type: multipart/alternative;
 boundary=c10b4997458f6d5d162bf459403a94c132b447d5e855eaebcffdd9803841

--c10b4997458f6d5d162bf459403a94c132b447d5e855eaebcffdd9803841
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Thu Apr 24, 2025 at 8:57 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Wed, 23 Apr 2025, Hans de Goede wrote:
>> On 23-Apr-25 6:14 PM, Kurt Borja wrote:
>> > On Wed Apr 23, 2025 at 10:44 AM -03, Hans de Goede wrote:
>> >> On 23-Apr-25 3:27 PM, Ilpo J=C3=A4rvinen wrote:
>> >>> On Fri, 11 Apr 2025, Kurt Borja wrote:
>> >>>
>> >>>> Use a faux device parent for registering the platform_profile inste=
ad of
>> >>>> a "fake" platform device.
>> >>>>
>> >>>> The faux bus is a minimalistic, single driver bus designed for this
>> >>>> purpose.
>> >>>
>> >>> Hi Kurt, Hans & Greg,
>> >>>
>> >>> I'm not sure about this change. So dell-pc not a platform device but
>> >>> a "fake".
>> >>
>> >> Arguably the dell-pc driver does not need a struct device at all,
>> >> since it just exports /sys/firmware/acpi/platform_profile sysfs
>> >> interface by using the relevant Dell SMBIOS interfaces for this.
>> >>
>> >> As such maybe we should just completely get rid of the whole
>> >> struct device here?
>> >>
>> >> If we do decide to keep the struct device, then since the struct devi=
ce
>> >> seems to just be there to tie the lifetime of the platform_profile
>> >> handler to, I guess that calling it a faux device is fair.
>> >=20
>> > I think it's important to mention that a parent device is required to
>> > register a platform profile, see [1].
>>=20
>> Ah ok, that is new, I guess that was changed with the new support
>> for registering multiple platform-profile handlers.
>>=20
>> > I guess we could get away with removing the device altogether from her=
e,
>> > but that would require to find another suitable parent device. The
>> > obvious choice would be the `dell-smbios` device, however that would
>> > require exporting it in the first place.
>> >=20
>> > For some reason, exporting devices doesn't seem right to me, so IMO a
>> > faux device is a good choice here.
>>=20
>> Agreed.
>>=20
>> > Another solution that would make more sense, lifetime wise, is to turn
>> > this into an aux driver and let `dell-smbios` create the matching aux
>> > device.
>
> Well, that was what caused part of my confusion / uncertainty here as
> I could see that aux bus between these two drivers. Obviously, it's not=
=20
> there currently but conceptually this relationship looks what full-blown=
=20
> aux bus was supposed to solve.
>
> The other part was that as per Greg's simple classification, certainly=20
> this driver needs to access platform resources. BUT, that access is route=
d=20
> through another driver which is a case his answer/classification did not=
=20
> cover.

Perhaps it didn't cover it because, as you mentioned, this falls under
the aux bus use cases.

>
>> > I could do this, but I think it's overly complicated.
>>
>> Yes that does seem overly complicated, lets just go with the faux
>> device.
>
> Okay. In part, this was also to check whether replacing full-blown aux bu=
s=20
> with faux should be considered another kind of "abuse". I've no problem=
=20
> with accepting faux for cases like this as I see these as policy /=20
> convention decision more than one being right and another wrong. :-)

Now that you put it that way, I guess this still is kind of "abusive",
but is still an improvement over creating a full platform device.

Nevertheless, although this driver do access platform resources, it does
it completely detached from the "dell-smbios" device. The only use of
the platform device here was `&pdev->dev` :p

>
> Thanks to all who answered.

Thanks for your review!

--=20
 ~ Kurt

--c10b4997458f6d5d162bf459403a94c132b447d5e855eaebcffdd9803841--

--b693a78c1fa53d64a99935a3c67a40a2d8abb52fbfad6c290c4c0585accc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=57E3B6585920A69A.asc
Content-Type: application/pgp-keys; charset=UTF-8

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUlOQkdnS2Vtc0JFQURsQmEz
YWJqc29Fb2Y3WUFwaFJheWkzWXJCZ0lwMDZVaW5Ta2hDa3Y3ZzRkYU5VVXZ6CkQ4Y2xyTkhaNkdD
dDREWEVqYmJBcFFaYVpTd24rL2UwR3Q3RkFLOEhZZnRWaXIxNTh0ZnRXazhKUHFOM2NaYUgKYTE1
Qiswc3ZZYzliQnNtU1p5TU5zbGxJQk9FM2g0b1NxSVZyUHVFV0VxSys2Y0NhY2NqOTV6d1lqc0ov
VDRYUgpBbFJlQzEzcjF0UTR6T09paTlMZ1VMZnFYSG1Va3J4eHZ6TExCN1pBZ3N4RUlUMW5OK3pK
dlB4Q2VOR2pxWTFCCklEMGw1QVd5cnRwM2JRRnJjWk4vUkRscER3UzBrb3B2WmFZeENMN1p4T29a
dHd2OVR6NmdQMzBXcmN4NUpHUXEKenZScG1VKytUWWtOQlRpL2dYd1VUYmliVFQ5QVJGNS9JRVJu
T3JEZTczWWx6NzcweVA0ZlM0VnA5ZXBNcGhqTgpKNTlGZGswVGFrc0w2dEFja1ozUlZjTGtqQklq
N2FzWGY5dHFNNkdQNHVYNGxadmM5QVd0Q2JGRUZqd1lBVHJ1CmgxZmN6SGJxN3grRXNjZ2MzYmFv
YjVXcEF2RFJWMlU2YUZlWUp3OFQyU3FIRXI5TzdNUEhWOUdkdk9LYXJrczEKUHpqeFArMjl2WDAr
eVNSN2tQY2wzZHV1SmN4UHV0QksvNHR5WWdpbUVBQll1S3ZaZ2ZLWlZCdEVEUFh5M1N4LwptZVd4
Q2I0YWloU0NGdm9lTVpRSmlqTnJNYS9WSEpQanp4S3pqRER0Q0xtWnNTZURqWEdqT0V6RWFsTzRI
dEhwCm5TeW1nOHVyZnJyUnRIWks1eVErK2gyYThYY3RuUGtyVTdyMEwxQm9BNUU1NHVxUEdqZ29Z
bzRuOVFBUkFRQUIKdEIxTGRYSjBJRUp2Y21waElEeHJkWFZ5ZEdKQVoyMWhhV3d1WTI5dFBva0NW
d1FUQVFnQVFRSWJBUVVMQ1FnSApBZ0lpQWdZVkNna0lDd0lFRmdJREFRSWVCd0lYZ0JZaEJGVFR2
aGNLNzNkNWc4UEdPMWZqdGxoWklLYWFCUUpvCkNueHhCUWtFNkdlR0FBb0pFRmZqdGxoWklLYWEv
R1VQL1Izd2Z6RlJLK1NuVG81dGJKQVJCRzllRXpMY0ljTGsKK2FDODQwZ3oxM29MV0QwSFdzOTBE
anFOT3o0UGZQWVd5RWxqZWRnMzNlY2dRaTVBMFQ0dUUzUExvY3pCMWNHbQpVS2JOd0VVM1VSbnp4
UkdtOGUyUzFDeWF5VVFCRmxOYUpsU2Nva0xZb0pieHBlRk5DYlVUTVh1YXlvbm82dmx6Cm1PR0Zm
bGllOTl1NlJzZmFURytRb0MydVJQdldjcGFwVVBGUHN3Yk9jb1lLcytqb0RsZXZBQ2hMdi9EenFW
VG4KY29MZ1RRVFVJNXREa0ZQUDFEOFFUb3hmUjRqQkN2QnNsRnJQK3ZlS1pFeVVydkhLZ2dOUUVI
Qlh6ZkNOWVdmegptNU80ellRYlRLNDVJVHlFZmNGd2VKSGpYRGZ3MVBWcHBmemdUNUJ4ME9wQ055
bGo3TkU1d2hUcFJuS1RpcG4rCi9Xbk5yeURDblJmVHZBUS9zc0FwMFVzQzRlR2ZHZ0g5SE8ram1U
QjJyS0ZzU2p0WkNtL3dpVFRKK3E4Z1dSekcKeThXWEJhdTFObnRBUTl6STVTWnMrc2JKbVNNcXJ0
N1NCL05HYjY3dk50M2plbldjMlhpSWVaNFhZelNMcXBUUAo4VUlhOTU5akRqK0RKQlJZQkpBUEhD
YW4xLzBxRTBkeDljRGdEeE9VcVFNMGR6anc0ZS9QWDJQeDRVZFcvU243CmhEYkRwQUYxeGkrdDUx
SzRmYzFld0FUTGxuVVJkZG1JVG9aZmJmcVNuQjEyQUk5bGpvWU5OemhOUGNZYnZpUVYKSFM3Y1U4
Vnl1eGFvMW95M25qeERXTXJrUkY4cDEwNW82eXZlQXFJTHFyaiswaFFLeWNjaHczcXFkdnhRK3dW
SgpKYUtrNHdwUjFKbTZ1RGdFYUFwN2tCSUtLd1lCQkFHWFZRRUZBUUVIUU93a2xwQnBqY3IyR0Zs
WmhiR2FXWkxzCmIwNHlOcWkrMFBRR2dKUTF4SDFyQXdFSUI0a0NOZ1FZQVFnQUlCWWhCRlRUdmhj
SzczZDVnOFBHTzFmanRsaFoKSUthYUJRSm9DbnVRQWhzTUFBb0pFRmZqdGxoWklLYWFYSFFQLzJN
MnlhT0xVdm05eWN6OTA5a2dTTG93LzlRaAp6dGZmeHlPMkdERGVYelVCOWcxaUNZNXNzZGdTaVI1
eWd4cnp3cWpad3VBR2sydm9FNkQ5elJ2d2xDalVlL1ljCi9JVTZiU3d3TEVvYTVPNzcyRW5iSXpK
dlZFYUxZM2JZdHZpTk5KaXhrQWtSQjBLWDhWL2ZrZ3kyTUVLVGwxY08KcnRvajNVS1gxWFRkZ2Vo
MjZYLzJxUzkzaUFLc1V1cjIyNjhVNUVRc1NmMkE4VUIzOFhZdTQ4RkdHUWtXNmFBUwo0cE9OSlY1
MFdzaUZHZlpwaVFiU2E3WENqNXB6NWJhK3ZHU0MvT0h5bUNNQWIrZ1JQM2pkRDBoMzVIWEVrelFD
ClJUWXp4V2RmbldjQkhnQ2w0U1FOM3BBblpwODk4L2F5NCszckFnL1Q3ZUFjVzNSVGdVL0hVRUcy
NEd6cU5ISmYKTGI1eHREOURCcGpraHVqbElvMUdnemw1QVBJdGNDUnhETTNQMGxDdzhWK2drSzVj
S1NmTC9raDczcW1iNEtYcQo0RW05STJtMnhnMkU2ZFF3N3A0Y2tzV1VEYmtvS2JHTUk1MlMvcTZQ
UUxONGk1SU0yRkJCSXBaekZKRm03SGxxCjQwdkhHd1F5YzYxTTRrTlJoTVg1ZTZjdGRWRTZRN1Bi
RjY0TVEzb1krc1NUTWMyc2c2ZzEvY1lkS3NlVHpBSzMKQTE0c3c2MUNiRGNuYXJVL3YvZlhEbjVH
c25oTUJ5eEh5R2NUcHhLYXIrT1p4YXBISTBoSnNKUElqMDFZbHFxNwpQRXU0TnFobXRtejV1YkhG
K2FTUitQeGFSaTJ1VVVnelpuWmZxbVpsZTRHblEwRDh2eUU3ek04bUk3OEkvTkd3CkJMRWx3Y1hQ
c1FCZjNHNWF1RE1FYUFwN3R4WUpLd1lCQkFIYVJ3OEJBUWRBeTd2MUFBbzl1dkRZR0F4Q2ZucncK
blhLVzNRSFBmUXA5cmVGWFNsRHh0RE9KQXEwRUdBRUlBQ0FXSVFSVTA3NFhDdTkzZVlQRHhqdFg0
N1pZV1NDbQptZ1VDYUFwN3R3SWJBZ0NCQ1JCWDQ3WllXU0NtbW5ZZ0JCa1dDZ0FkRmlFRWgyQ2k5
dUphYnUxT3dGWGZGbUJECk9QU2YxR1lGQW1nS2U3Y0FDZ2tRRm1CRE9QU2YxR2F6bkFFQXpEQzRO
U2JzaVBjazRqNEsrdkJoNFZqVVczSmQKTTA1VkM1S3FvRXM0S2JnQkFJNFhyY3FrRGhqRG9WbnVk
TDJDTVJDbGtMQlpkQ0lhY201a1ZlS1pRZ1VNNDVFUQpBS1Fid1AzUDdrWnQ1Mm9vNXhaVjF5cmFw
N1ZmdkJuanBJd05zalQvNHAxVzVXd3pyaWV0NXhpbWttNnRmL3ViCkZXbEUyMldXanRCbWVkOWZH
UjVOWm9Hb3dQQWp0L3JGTjJ6T3NGUVdkT0FwZVVsenptVk1MTlpqcDAzMGgzWGcKb05QUlAzVzdD
YjFGb2NHSWdKZ2NKNVVzS0tvVFRDYTBqZWJqbk1zaGVuK25scjRKSTZkSU5lQ1JZdzFuaCs5Ygp5
cjFVb2F0UzM1dkhKTEJhVWtMdUJ2OFhVUFJtS0s3cmtoaHZ5VnYvTktmSWNpYStNcjZoNUJWT2xz
N1QzbUQwCjdPRmJwcWJkT0h2YS94dkwvNjZEVXA1cmlKM0N6dk9MYVFYTWlDSHN4dnltd0o2SWFq
eHZsMjZZbVo3VHlhdnQKditrb293bG9FeHVWb0dSdGRNditvUDFtblRlaWRJeDFRbitpMGE5SDNR
V1NmbmJQRDhwRW9Eb0RWckZ1YnhkTQpGSXdFWjRrYzlyVVhYdnU4c1ZoQ005Ti9ZU2FtN3pFQU9V
aFFKTlVHYk5wSzhIZ0wzMmthVEtKeGtVUUI1NzFQCkY4Q2dHUEU2Uk5vRW5BLzlJUUlLQ0VMMngw
M04wZXZuR2t0aVhncEZzS3pzWlVyTUhseVJwbGgza2tQSHl0QUcKUGNZNktSNVA0cmgyVFlhTyta
QWtsQ3lMRjBtYm5vOEJTVnEvbGl1emZDNHlDa2gvdFloOHVYRytlek5sbGFCegpnM1JTcDdiME1l
aWlETkdPZEhsZ291aGNwUklTNFIvUkZhcmtPNFoyNlRYK05WSXYxSDhwTGppMy9nY2FYV0RiCk5T
c2ZKVUxiTCtJRS9ZZnI4Tmo4UnQ1WUpad2hIbXhNSVZ3dWhDaTlKSCtJdURNRWFBcDd4eFlKS3dZ
QkJBSGEKUnc4QkFRZEFLa3hLaFFVUjM5K1Z3THZ5ZXYxQVIxbDFhcmRibitxdGoyUGljeVkwQ1JH
SkFqWUVHQUVJQUNBVwpJUVJVMDc0WEN1OTNlWVBEeGp0WDQ3WllXU0NtbWdVQ2FBcDd4d0liSUFB
S0NSQlg0N1pZV1NDbW1nbGxELzRoCmYrTUQzbEhOL3o0a0k4empLSjRzaCs2d3E3OU1iMWxHWnlG
Z05tNFpXOFRZSlZONkcvQ0pOL1kvQUZ3WDBpemoKUWFtenM2QTVGWmY2RUZSNGxrYkZMRkZVOFF0
QzNOZWRkbEM4UnE5QzQwOXdyYlIrRy9RcDc4S1d5dnlWTWVFSQpVMFFrNG10bUdtcm5rS3BpaTEx
Nk81dW9mM1cyZVZ6WXJ5OUFsV05rMHFQMkRaL0J4WUw4WEJIK21rTFB5TEthCk82MGZYZmxSTCs2
MTZrZDVJQWZmd1pxOTdtV1U5R1NrbWVZOTg0RCtjcVhycVdDWHgxVWxIeitxenN6ekFrekgKbXV6
Mk5SV2xvaWNaME1yY0h3NWZ0RHZJelkxaElSZFJjSGRrM3RMRHBYeGtabGRERFM0M2FwR0xHZURm
M3JIegpRSGdEdENTeDFmVDNPTDJQVDhuWlBraTNtbldKL0t3WDZ1MnJyRXJQOTJPWVBYMUFDY3dR
M3VLTmx2ZXZaa1hVCmFtYVJvSXJaRDY1RURvYmdva0N3d2ZvSzBHYSs4STBvZnRGS0JWNUNaRml4
bDloZjhYempXSzZlaWY4UVVrMzgKZmhoZU8zUHBJQXhoOCtwSHpwZElqRUFKSTN5Y2JkWWhGUlhw
ck42MTBLMzdjWG13bGpyRC9ZaGl5VUhMQUlIZgo5UmVweUgzMFVKTGl3Vk5NSE9abFJucDRHYUtF
a3BHUDB0U0UyWm9TR1d1Q3c3QnpPUW1qVG5Scm93NDFTbVdOCkNHMTNoaUdTRzNodlR3a2dPWXI3
ZkpReWRGcVFkK05PbnAzYURjOHIrMmpvc1JXcDlNaXdsSzJldVJrVHlnc3kKd09CVXZ6azczbWpV
K082aVlPdzdoaERiWEtjWjNIUS81bWg1YjhGQ3pBPT0KPUdSdlYKLS0tLS1FTkQgUEdQIFBVQkxJ
QyBLRVkgQkxPQ0stLS0tLQo=
--b693a78c1fa53d64a99935a3c67a40a2d8abb52fbfad6c290c4c0585accc--

--f8e0df50e0ac3106afbb77cd0b2f1ff19fa0e94c42b5b04d376b20835a2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaAs+QAAKCRAWYEM49J/U
ZuF3AP9ovSm3jFvrbA6gCLpJI+dBK/yPkVGCzkIk0NKuaPrTnwEAg907TIJ1AhLq
fCWk6PVg+wapMJHMcS+9hXQ43rta4gs=
=aJ3+
-----END PGP SIGNATURE-----

--f8e0df50e0ac3106afbb77cd0b2f1ff19fa0e94c42b5b04d376b20835a2c--
